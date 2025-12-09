#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>
#include <map>
#include <algorithm>
#include <iomanip>
#include <cmath>


struct Rule {
    std::string id;
    std::vector<std::string> conditions;
    std::string result;
    double cf;

    void print() const {
        std::cout << "  [" << id << "] IF ";
        for (size_t i = 0; i < conditions.size(); ++i) {
            std::cout << conditions[i];
            if (i < conditions.size() - 1) std::cout << " & ";
        }
        std::cout << " THEN " << result << " (CF: " << cf << ")" << std::endl;
    }
};

#pragma region MISC
std::string trim(const std::string& str) {
    size_t first = str.find_first_not_of(" \t\r\n");
    if (std::string::npos == first) return "";
    size_t last = str.find_last_not_of(" \t\r\n");
    return str.substr(first, (last - first + 1));
}
#pragma endregion 

std::vector<std::string> split(const std::string& s, char delimiter) {
    std::vector<std::string> tokens;
    std::string token;
    std::istringstream tokenStream(s);
    while (std::getline(tokenStream, token, delimiter)) {
        tokens.push_back(trim(token));
    }
    return tokens;
}

class KnowledgeBase {
private:
    std::vector<Rule> rules;
    std::map<std::string, double> facts; 
    std::map<std::string, double> factsStart;
    struct GoalFrame {
        std::string factName;
        int currentRuleIdx;
        int currentConditionIdx;
        std::vector<int> candidateRules;
        
        GoalFrame(std::string name) : factName(name), currentRuleIdx(0), currentConditionIdx(0) {}
    };

public:

    void getUserInput() {
        std::cout << "\n=== USER INPUT MODE ===" << std::endl;
        std::cout << "Please answer the following questions to get a recommendation.\n" << std::endl;

        auto ask = [&](std::string question, std::vector<std::pair<std::string, std::string>> options) {
            std::cout << question << std::endl;
            for (size_t i = 0; i < options.size(); ++i) {
                std::cout << i + 1 << ". " << options[i].second << std::endl;
            }

            int choice;
            std::cout << "> Choose option (1-" << options.size() << "): ";
            std::cin >> choice;

            double cf;
            std::cout << "> Enter confidence (0.1 - 1.0): ";
            std::cin >> cf;

            if (choice >= 1 && choice <= options.size()) {
                std::string factKey = options[choice - 1].first;
                facts[factKey] = cf;
                std::cout << "Recorded: " << factKey << " with CF " << cf << "\n" << std::endl;
            }
        };

        // 1. Вопрос про настроение
        ask("How are you feeling right now?", {
            {"mood_tired", "Tired / Exhausted"},
            {"mood_energetic", "Energetic / Active"},
            {"mood_sad", "Melancholic / Sad"},
            {"mood_romantic", "Romantic"},
            {"mood_curious", "Curious / Want to learn"}
        });

        // 2. Вопрос про компанию
        ask("Who are you watching with?", {
            {"company_alone", "Alone"},
            {"company_friends", "With friends"},
            {"company_partner", "With partner (date)"},
            {"company_parents", "With parents"},
            {"company_kids", "With children"}
        });

        // 3. Вопрос про время
        ask("How much time do you have?", {
            {"time_short", "Short (under 90 min)"},
            {"time_medium", "Average (about 2 hours)"},
            {"time_long", "Long (whole evening)"}
        });

        // 4. Вопрос про интеллектуальную нагрузку
        ask("Do you want to think hard?", {
            {"intellect_low", "No, brain off"},
            {"intellect_high", "Yes, give me a puzzle"}
        });

        // 5. Вопрос про предпочтения
        ask("Any specific preference?", {
            {"preference_scary", "Something scary"},
            {"preference_funny", "Something funny"},
            {"preference_none", "No specific preference"}
        });

        ask("Select your age group:", {
            {"age_adult", "Adult (18+)"},
            {"age_child", "Child / Teen (under 18)"}
        });

        factsStart = facts;
    }
    bool loadFacts(const std::string& filename) {
        std::ifstream file(filename);
        if (!file.is_open()) return false;
        std::string line;
        while (std::getline(file, line)) {
            if (line.empty()) continue;
            std::vector<std::string> parts = split(line, ',');
            if (parts.size() >= 2) {
                facts[parts[0]] = std::stod(parts[1]);
            }
        }
        return true;
    }

    bool loadRules(const std::string& filename) {
        std::ifstream file(filename);
        if (!file.is_open()) return false;
        std::string line;
        while (std::getline(file, line)) {
            if (line.empty()) continue;
            std::vector<std::string> parts = split(line, ',');
            if (parts.size() < 3) continue;
            Rule newRule;
            newRule.id = parts[0];
            newRule.cf = std::stod(parts.back());
            newRule.result = parts[parts.size() - 2];
            for (size_t i = 1; i < parts.size() - 2; ++i) {
                newRule.conditions.push_back(parts[i]);
            }
            rules.push_back(newRule);
        }
        return true;
    }

    void runForwardChaining() {
        std::cout << "\n=== STARTING FORWARD CHAINING ===\n" << std::endl;
        
        bool change_made = true;
        int iteration = 1;

        while (change_made) {
            change_made = false;
            std::cout << "--- Iteration " << iteration << " ---" << std::endl;

            for (const auto& rule : rules) {
                // 1. Проверяем условия
                bool conditions_met = true;
                double min_condition_cf = 1.0;

                for (const auto& cond : rule.conditions) {
                    if (facts.find(cond) == facts.end() || facts[cond] <= 0.0) {
                        conditions_met = false;
                        break;
                    }
                    if (facts[cond] < min_condition_cf) {
                        min_condition_cf = facts[cond];
                    }
                }

                if (conditions_met) {
                    double calculated_cf = min_condition_cf * rule.cf;
                    
                    bool need_update = false;
                    double old_cf = 0.0;

                    if (facts.find(rule.result) == facts.end()) {
                        need_update = true;
                    } else {
                        old_cf = facts[rule.result];
                        if (calculated_cf > old_cf) {
                            need_update = true;
                        }
                    }

                    if (need_update) {
                        facts[rule.result] = calculated_cf;
                        change_made = true;

                        std::cout << "FIRED Rule " << rule.id << ": ";
                        std::cout << "Conditions met (Min Input CF: " << min_condition_cf << "). ";
                        std::cout << "Result: " << rule.result;
                        
                        if (old_cf > 0) std::cout << " updated CF " << old_cf << " -> " << calculated_cf;
                        else            std::cout << " added with CF " << calculated_cf;
                        
                        std::cout << std::endl;
                    }
                }
            }
            
            if (!change_made) {
                std::cout << "No changes made. Stopping inference." << std::endl;
            }
            iteration++;
        }
        std::cout << "\n=== INFERENCE COMPLETE ===\n" << std::endl;
    }

    bool runBackwardChaining(const std::string& targetFact) {
        std::cout << "\n=== STARTING BACKWARD CHAINING (Goal: " << targetFact << ") ===\n";
        
        std::map<std::string, double> sessionFacts;
        for (const auto& [key, val] : facts) {
             bool is_derived = (key.find("movie_") == 0) || (key.find("niche_") == 0) || 
                               (key.find("genre_") == 0) || (key.find("atmosphere_") == 0) ||
                               (key.find("preference_") == 0 && key != "preference_none");
             if (!is_derived && val > 0) {
                 sessionFacts[key] = val;
             }
        }

        std::vector<GoalFrame> stack;
        stack.push_back(GoalFrame(targetFact));
        stack.back().candidateRules = findRulesForResult(targetFact);

        std::vector<std::string> traceLog;
        bool success = false;
        
        int safety_counter = 0; 
        const int MAX_OPS = 10000;

        while (!stack.empty()) {
            if (++safety_counter > MAX_OPS) {
                std::cout << "ERROR: Inference Loop Detected!" << std::endl;
                return false;
            }

            GoalFrame& frame = stack.back();

            if (sessionFacts.count(frame.factName) && sessionFacts[frame.factName] > 0) {
                stack.pop_back(); 
                if (stack.empty()) success = true;
                continue;
            }

            if (frame.currentRuleIdx >= frame.candidateRules.size()) {
                stack.pop_back();
                
                if (!stack.empty()) {                    
                    GoalFrame& parent = stack.back();
                    parent.currentRuleIdx++;
                    parent.currentConditionIdx = 0;
                }
                continue; 
            }

            int ruleIdx = frame.candidateRules[frame.currentRuleIdx];
            const Rule& rule = rules[ruleIdx];

            if (frame.currentConditionIdx >= rule.conditions.size()) {
                double min_cf = 1.0;
                for (const auto& cond : rule.conditions) {
                    double val = (sessionFacts.count(cond)) ? sessionFacts[cond] : 0.0;
                    min_cf = std::min(min_cf, val);
                }
                double final_cf = min_cf * rule.cf;
                
                sessionFacts[frame.factName] = final_cf;
                
                std::stringstream ss;
                ss << "PROVED: " << frame.factName << " using Rule " << rule.id 
                   << " (CF: " << std::fixed << std::setprecision(2) << final_cf << ")";
                traceLog.push_back(ss.str());

                stack.pop_back();
                
                if (stack.empty()) success = true;
                continue;
            }
            std::string condition = rule.conditions[frame.currentConditionIdx];

            if (sessionFacts.count(condition) && sessionFacts[condition] > 0) {
                frame.currentConditionIdx++;
            } else {
                bool cycle = false;
                for(const auto& f : stack) if (f.factName == condition) cycle = true;

                if (cycle) {
                    frame.currentRuleIdx++;
                    frame.currentConditionIdx = 0;
                } else {
                    GoalFrame newFrame(condition);
                    newFrame.candidateRules = findRulesForResult(condition);

                    if (newFrame.candidateRules.empty()) {
                        frame.currentRuleIdx++;
                        frame.currentConditionIdx = 0;
                    } else {
                        stack.push_back(newFrame);
                    }
                }
            }
        }

        if (success) {
            std::cout << "Target '" << targetFact << "' CONFIRMED." << std::endl;
            std::cout << "--- Inference Chain (Normal Order) ---" << std::endl;
            for (const auto& log : traceLog) {
                std::cout << " -> " << log << std::endl;
            }
            std::cout << "\n[Image of directed acyclic graph showing layers from inputs to movies]" << std::endl;
            return true;
        } else {
            std::cout << "Target '" << targetFact << "' could NOT be proven." << std::endl;
            return false;
        }
    }

    std::vector<int> findRulesForResult(const std::string& resultName) {
        std::vector<int> indices;
        for (size_t i = 0; i < rules.size(); ++i) {
            if (rules[i].result == resultName) {
                indices.push_back(i);
            }
        }
        return indices;
    }

    void printFacts() {
        std::cout << "=== RESULT FACTS ===" << std::endl;
        
        for (const auto& [name, cf] : facts) {
            std::cout << "fact: " << name << " " << cf << std::endl;
        }
    }

    void printRecommendations() {
        std::cout << "=== FINAL MOVIE RECOMMENDATIONS ===" << std::endl;
        std::vector<std::pair<std::string, double>> results;

        for (const auto& [name, cf] : facts) {
            // Ищем факты, начинающиеся с "movie_" и имеющие вес > 0
            if (name.find("movie_") == 0 && cf > 0) {
                results.push_back({name, cf});
            }
        }

        std::sort(results.begin(), results.end(), [](const auto& a, const auto& b) {
            return a.second > b.second;
        });

        if (results.empty()) {
            std::cout << "No recommendations found. Try changing inputs." << std::endl;
        } else {
            for (const auto& p : results) {
                std::cout << "Recommended: " << std::setw(25) << std::left << p.first 
                          << " | Certainty: " << std::fixed << std::setprecision(2) << p.second * 100 << "%" << std::endl;
            }
        }
    }

    std::map<std::string, double> getFacts() {
        return facts;
    }
};

int main() {
    KnowledgeBase kb;

    if (!kb.loadRules("rules.txt")) {
        std::cerr << "Error loading rules." << std::endl;
        return 1;
    }

    kb.getUserInput();
    kb.runForwardChaining();
    
    std::string best_movie = "";
    double max_cf = -1.0;
    
    for(auto const& [key, val] : kb.getFacts()) {
        if (key.find("movie_") == 0 && val > max_cf) {
            max_cf = val;
            best_movie = key;
        }
    }

    kb.printRecommendations();

    if (!best_movie.empty()) {
        std::cout << "\n\nPress Enter to see the Explanation (Backward Chaining)...";
        std::cin.ignore(); std::cin.get();
        
        kb.runBackwardChaining(best_movie);
    }

    return 0;
}