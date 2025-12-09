import sys

def parse_rules(filename):
    output_filename = "generated_rules.clp"
    clp_output = [";;; GENERATED RULES FROM rules.txt\n"]
    
    try:
        with open(filename, 'r', encoding='utf-8') as f:
            lines = f.readlines()
            
        for line in lines:
            line = line.strip()
            if not line or line.startswith("[") or line.startswith(";"): continue
            
            # Разделяем по запятой
            parts = [p.strip() for p in line.split(',')]
            if len(parts) < 3: continue
            
            # Формат: R_ID, cond1, cond2..., RESULT, CF
            r_id = parts[0]
            rule_cf = float(parts[-1])
            result = parts[-2]
            conditions = parts[1:-2]
            
            # Формируем CLIPS правило
            rule_str = f'(defrule {r_id}\n'
            
            # Условия (LHS)
            cond_vars = []
            for i, cond in enumerate(conditions):
                var_name = f"?cf{i+1}"
                cond_vars.append(var_name)
                # Ищем факт с таким ID и уверенностью > 0.2
                # Используем конструкцию pattern matching
                rule_str += f'   (fact (id {cond}) (cf {var_name}&:(> {var_name} 0.2)))\n'
            
            rule_str += '   =>\n'
            
            # Действия (RHS)
            # 1. Находим минимум среди условий (логика AND)
            if len(cond_vars) == 1:
                rule_str += f'   (bind ?min-cf {cond_vars[0]})\n'
            else:
                vars_str = " ".join(cond_vars)
                rule_str += f'   (bind ?min-cf (min {vars_str}))\n'
            
            # 2. Умножаем на уверенность самого правила
            rule_str += f'   (bind ?final-cf (* ?min-cf {rule_cf}))\n'
            
            # 3. Добавляем результат (просто assert, объединение сделает core.clp)
            rule_str += f'   (assert (fact (id {result}) (cf ?final-cf) (source "{r_id}")))\n'
            rule_str += f'   (printout t "FIRED {r_id}: {result} with CF " ?final-cf crlf)\n'
            rule_str += ')\n\n'
            
            clp_output.append(rule_str)
            
        with open(output_filename, "w", encoding='utf-8') as out:
            out.writelines(clp_output)
        
        print(f"Success! File '{output_filename}' created.")
            
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    parse_rules("rules.txt")