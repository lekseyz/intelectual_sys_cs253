;;; =========================================================
;;; INPUT.CLP: Загрузка и взаимодействие с пользователем
;;; =========================================================

;; 3. Правила ввода пользователя
(defrule start-interaction
   (initial-fact)
   =>
   (printout t "=== MOVIE RECOMMENDER SYSTEM (CLIPS + CF) ===" crlf)
   (printout t "Answer using the keywords provided." crlf)
   
   ;; 1. Настроение
   (printout t "Mood (tired/energetic/sad/romantic/curious): " )
   (bind ?m (read))
   (if (neq ?m "none") then 
      (assert (fact (id (sym-cat mood_ ?m)) (cf 1.0) (source "user")))
   )

   ;; 2. Компания
   (printout t "Company (alone/friends/partner/parents/kids): " )
   (bind ?c (read))
   (if (neq ?c "none") then 
      (assert (fact (id (sym-cat company_ ?c)) (cf 1.0) (source "user")))
   )
   
   ;; 3. Предпочтения
   (printout t "Preference (scary/funny/action/scifi/serious/none): " )
   (bind ?p (read))
   (if (neq ?p "none") then 
      (assert (fact (id (sym-cat preference_ ?p)) (cf 1.0) (source "user")))
   )

   ;; 4. Время
   (printout t "Time available (short/medium/long): " )
   (bind ?t (read))
   (if (neq ?t "none") then 
      (assert (fact (id (sym-cat time_ ?t)) (cf 1.0) (source "user")))
   )

   ;; 5. Возраст
   (printout t "Age group (child/adult): " )
   (bind ?a (read))
   (if (neq ?a "none") then 
      (assert (fact (id (sym-cat age_ ?a)) (cf 1.0) (source "user")))
   )

   ;; 6. Интеллект
   (printout t "Brain effort (low/high): " )
   (bind ?i (read))
   (if (neq ?i "none") then 
      (assert (fact (id (sym-cat intellect_ ?i)) (cf 1.0) (source "user")))
   )
)

;; Правило вывода финальных рекомендаций
(defrule print-recommendations
   (declare (salience -10)) ; Срабатывает после того, как все вывелось
   ?f <- (fact (id ?id) (cf ?cf))
   ;; Показываем только факты с высокой уверенностью
   (test (> ?cf 0.4))
   =>
   ;; Если ID начинается на "movie_", это рекомендация фильма
   (if (eq (str-index "movie_" (str-cat ?id)) 1)
      then 
        (printout t ">>> RECOMMENDED MOVIE: " ?id " | Confidence: " ?cf crlf)
      ;; Можно раскомментировать для отладки промежуточных выводов:
      ;; else 
      ;;  (printout t "Intermediate fact: " ?id " | CF: " ?cf crlf)
   )
)
