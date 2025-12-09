;;; =========================================================
;;; CORE.CLP: Шаблоны и функции для работы с CF
;;; =========================================================

(deftemplate fact
   (slot id (type SYMBOL))       
   (slot cf (type FLOAT) (default 0.0)) 
   (slot source (type STRING) (default "none"))   
)

;;; Функция объединения уверенности (MYCIN formula)
;;; CF_new = CF1 + CF2 * (1 - CF1) для положительных значений
(deffunction combine-cf (?cf1 ?cf2)
   (return (+ ?cf1 (* ?cf2 (- 1.0 ?cf1))))
)

;;; =========================================================
;;; SYSTEM RULES (Служебные правила)
;;; =========================================================

;;; ГЛАВНОЕ ПРАВИЛО: Объединение дубликатов
;;; Если есть два факта с одинаковым ID, объединяем их в один.
(defrule system-combine-facts
   (declare (salience 100)) ; Максимальный приоритет
   ?f1 <- (fact (id ?id) (cf ?cf1))
   ?f2 <- (fact (id ?id) (cf ?cf2))
   ;; Сравниваем индексы, чтобы не срабатывать на одном и том же факте
   (test (< (fact-index ?f1) (fact-index ?f2))) 
   =>
   (retract ?f1 ?f2) ; Удаляем оба старых факта
   (bind ?new-cf (combine-cf ?cf1 ?cf2))
   (assert (fact (id ?id) (cf ?new-cf) (source "combined")))
   ;; (printout t "DEBUG: Combined " ?id " (" ?cf1 " + " ?cf2 ") -> " ?new-cf crlf)
)

;;; Очистка мусора: удаляем факты с слишком низкой уверенностью
(defrule system-cleanup-low-cf
   (declare (salience -100)) ; Низкий приоритет, чистим в конце
   ?f <- (fact (cf ?cf&:(< ?cf 0.2)))
   =>
   (retract ?f)
)