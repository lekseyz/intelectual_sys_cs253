;;; GENERATED RULES FROM rules.txt
(defrule R1
   (fact (id time_long) (cf ?cf1&:(> ?cf1 0.2)))
   =>
   (bind ?min-cf ?cf1)
   (bind ?final-cf (* ?min-cf 0.75))
   (assert (fact (id time_medium) (cf ?final-cf) (source "R1")))
   (printout t "FIRED R1: time_medium with CF " ?final-cf crlf)
)

(defrule R2
   (fact (id time_medium) (cf ?cf1&:(> ?cf1 0.2)))
   =>
   (bind ?min-cf ?cf1)
   (bind ?final-cf (* ?min-cf 0.75))
   (assert (fact (id time_short) (cf ?final-cf) (source "R2")))
   (printout t "FIRED R2: time_short with CF " ?final-cf crlf)
)

(defrule R3
   (fact (id preference_none) (cf ?cf1&:(> ?cf1 0.2)))
   =>
   (bind ?min-cf ?cf1)
   (bind ?final-cf (* ?min-cf 0.4))
   (assert (fact (id preference_scary) (cf ?final-cf) (source "R3")))
   (printout t "FIRED R3: preference_scary with CF " ?final-cf crlf)
)

(defrule R4
   (fact (id preference_none) (cf ?cf1&:(> ?cf1 0.2)))
   =>
   (bind ?min-cf ?cf1)
   (bind ?final-cf (* ?min-cf 0.4))
   (assert (fact (id preference_funny) (cf ?final-cf) (source "R4")))
   (printout t "FIRED R4: preference_funny with CF " ?final-cf crlf)
)

(defrule R5
   (fact (id preference_none) (cf ?cf1&:(> ?cf1 0.2)))
   =>
   (bind ?min-cf ?cf1)
   (bind ?final-cf (* ?min-cf 0.4))
   (assert (fact (id preference_action) (cf ?final-cf) (source "R5")))
   (printout t "FIRED R5: preference_action with CF " ?final-cf crlf)
)

(defrule R6
   (fact (id preference_none) (cf ?cf1&:(> ?cf1 0.2)))
   =>
   (bind ?min-cf ?cf1)
   (bind ?final-cf (* ?min-cf 0.4))
   (assert (fact (id preference_scifi) (cf ?final-cf) (source "R6")))
   (printout t "FIRED R6: preference_scifi with CF " ?final-cf crlf)
)

(defrule R7
   (fact (id preference_none) (cf ?cf1&:(> ?cf1 0.2)))
   =>
   (bind ?min-cf ?cf1)
   (bind ?final-cf (* ?min-cf 0.4))
   (assert (fact (id preference_serious) (cf ?final-cf) (source "R7")))
   (printout t "FIRED R7: preference_serious with CF " ?final-cf crlf)
)

(defrule R8
   (fact (id mood_tired) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id intellect_low) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id atmosphere_chill) (cf ?final-cf) (source "R8")))
   (printout t "FIRED R8: atmosphere_chill with CF " ?final-cf crlf)
)

(defrule R9
   (fact (id mood_tired) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id time_short) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.8))
   (assert (fact (id atmosphere_chill) (cf ?final-cf) (source "R9")))
   (printout t "FIRED R9: atmosphere_chill with CF " ?final-cf crlf)
)

(defrule R10
   (fact (id mood_energetic) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id company_friends) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.95))
   (assert (fact (id atmosphere_party) (cf ?final-cf) (source "R10")))
   (printout t "FIRED R10: atmosphere_party with CF " ?final-cf crlf)
)

(defrule R11
   (fact (id mood_romantic) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id company_partner) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 1.0))
   (assert (fact (id atmosphere_date) (cf ?final-cf) (source "R11")))
   (printout t "FIRED R11: atmosphere_date with CF " ?final-cf crlf)
)

(defrule R12
   (fact (id mood_curious) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id intellect_high) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id atmosphere_educational) (cf ?final-cf) (source "R12")))
   (printout t "FIRED R12: atmosphere_educational with CF " ?final-cf crlf)
)

(defrule R13
   (fact (id age_child) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id company_parents) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 1.0))
   (assert (fact (id atmosphere_family_safe) (cf ?final-cf) (source "R13")))
   (printout t "FIRED R13: atmosphere_family_safe with CF " ?final-cf crlf)
)

(defrule R14
   (fact (id mood_sad) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id preference_scary) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.7))
   (assert (fact (id atmosphere_tension) (cf ?final-cf) (source "R14")))
   (printout t "FIRED R14: atmosphere_tension with CF " ?final-cf crlf)
)

(defrule R15
   (fact (id mood_energetic) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id preference_funny) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.8))
   (assert (fact (id atmosphere_party) (cf ?final-cf) (source "R15")))
   (printout t "FIRED R15: atmosphere_party with CF " ?final-cf crlf)
)

(defrule R16
   (fact (id company_kids) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id time_medium) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id atmosphere_family_safe) (cf ?final-cf) (source "R16")))
   (printout t "FIRED R16: atmosphere_family_safe with CF " ?final-cf crlf)
)

(defrule R17
   (fact (id company_alone) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id mood_curious) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.7))
   (assert (fact (id atmosphere_educational) (cf ?final-cf) (source "R17")))
   (printout t "FIRED R17: atmosphere_educational with CF " ?final-cf crlf)
)

(defrule R18
   (fact (id mood_sad) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id company_friends) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.8))
   (assert (fact (id atmosphere_chill) (cf ?final-cf) (source "R18")))
   (printout t "FIRED R18: atmosphere_chill with CF " ?final-cf crlf)
)

(defrule R19
   (fact (id mood_curious) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id company_alone) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.6))
   (assert (fact (id atmosphere_tension) (cf ?final-cf) (source "R19")))
   (printout t "FIRED R19: atmosphere_tension with CF " ?final-cf crlf)
)

(defrule R20
   (fact (id company_partner) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id preference_funny) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.7))
   (assert (fact (id atmosphere_chill) (cf ?final-cf) (source "R20")))
   (printout t "FIRED R20: atmosphere_chill with CF " ?final-cf crlf)
)

(defrule R21
   (fact (id time_short) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id preference_funny) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.6))
   (assert (fact (id atmosphere_party) (cf ?final-cf) (source "R21")))
   (printout t "FIRED R21: atmosphere_party with CF " ?final-cf crlf)
)

(defrule R22
   (fact (id intellect_low) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id company_friends) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.8))
   (assert (fact (id atmosphere_party) (cf ?final-cf) (source "R22")))
   (printout t "FIRED R22: atmosphere_party with CF " ?final-cf crlf)
)

(defrule R23
   (fact (id mood_energetic) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id time_long) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.5))
   (assert (fact (id atmosphere_educational) (cf ?final-cf) (source "R23")))
   (printout t "FIRED R23: atmosphere_educational with CF " ?final-cf crlf)
)

(defrule R24
   (fact (id atmosphere_chill) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id preference_funny) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.8))
   (assert (fact (id genre_comedy) (cf ?final-cf) (source "R24")))
   (printout t "FIRED R24: genre_comedy with CF " ?final-cf crlf)
)

(defrule R25
   (fact (id atmosphere_chill) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id preference_scary) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id genre_horror) (cf ?final-cf) (source "R25")))
   (printout t "FIRED R25: genre_horror with CF " ?final-cf crlf)
)

(defrule R26
   (fact (id atmosphere_party) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id time_medium) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.85))
   (assert (fact (id genre_comedy) (cf ?final-cf) (source "R26")))
   (printout t "FIRED R26: genre_comedy with CF " ?final-cf crlf)
)

(defrule R27
   (fact (id atmosphere_party) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id time_long) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id genre_action) (cf ?final-cf) (source "R27")))
   (printout t "FIRED R27: genre_action with CF " ?final-cf crlf)
)

(defrule R28
   (fact (id atmosphere_date) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id time_long) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.8))
   (assert (fact (id genre_drama) (cf ?final-cf) (source "R28")))
   (printout t "FIRED R28: genre_drama with CF " ?final-cf crlf)
)

(defrule R29
   (fact (id atmosphere_educational) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id intellect_high) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id genre_documentary) (cf ?final-cf) (source "R29")))
   (printout t "FIRED R29: genre_documentary with CF " ?final-cf crlf)
)

(defrule R30
   (fact (id atmosphere_educational) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id preference_scary) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.7))
   (assert (fact (id genre_scifi) (cf ?final-cf) (source "R30")))
   (printout t "FIRED R30: genre_scifi with CF " ?final-cf crlf)
)

(defrule R31
   (fact (id atmosphere_family_safe) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_child) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 1.0))
   (assert (fact (id genre_animation) (cf ?final-cf) (source "R31")))
   (printout t "FIRED R31: genre_animation with CF " ?final-cf crlf)
)

(defrule R32
   (fact (id atmosphere_tension) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id intellect_high) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.8))
   (assert (fact (id genre_scifi) (cf ?final-cf) (source "R32")))
   (printout t "FIRED R32: genre_scifi with CF " ?final-cf crlf)
)

(defrule R33
   (fact (id atmosphere_tension) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id preference_scary) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id genre_horror) (cf ?final-cf) (source "R33")))
   (printout t "FIRED R33: genre_horror with CF " ?final-cf crlf)
)

(defrule R34
   (fact (id atmosphere_chill) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id time_long) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.7))
   (assert (fact (id genre_fantasy) (cf ?final-cf) (source "R34")))
   (printout t "FIRED R34: genre_fantasy with CF " ?final-cf crlf)
)

(defrule R35
   (fact (id atmosphere_date) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id preference_funny) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.6))
   (assert (fact (id genre_comedy) (cf ?final-cf) (source "R35")))
   (printout t "FIRED R35: genre_comedy with CF " ?final-cf crlf)
)

(defrule R36
   (fact (id atmosphere_family_safe) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id time_short) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id genre_animation) (cf ?final-cf) (source "R36")))
   (printout t "FIRED R36: genre_animation with CF " ?final-cf crlf)
)

(defrule R37
   (fact (id atmosphere_party) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id preference_scary) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.5))
   (assert (fact (id genre_horror) (cf ?final-cf) (source "R37")))
   (printout t "FIRED R37: genre_horror with CF " ?final-cf crlf)
)

(defrule R38
   (fact (id mood_romantic) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id atmosphere_date) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.95))
   (assert (fact (id genre_drama) (cf ?final-cf) (source "R38")))
   (printout t "FIRED R38: genre_drama with CF " ?final-cf crlf)
)

(defrule R39
   (fact (id atmosphere_chill) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.7))
   (assert (fact (id genre_drama) (cf ?final-cf) (source "R39")))
   (printout t "FIRED R39: genre_drama with CF " ?final-cf crlf)
)

(defrule R40
   (fact (id atmosphere_party) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_child) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id genre_animation) (cf ?final-cf) (source "R40")))
   (printout t "FIRED R40: genre_animation with CF " ?final-cf crlf)
)

(defrule R41
   (fact (id atmosphere_tension) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id company_partner) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.6))
   (assert (fact (id genre_horror) (cf ?final-cf) (source "R41")))
   (printout t "FIRED R41: genre_horror with CF " ?final-cf crlf)
)

(defrule R42
   (fact (id atmosphere_date) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id preference_scary) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.4))
   (assert (fact (id genre_horror) (cf ?final-cf) (source "R42")))
   (printout t "FIRED R42: genre_horror with CF " ?final-cf crlf)
)

(defrule R43
   (fact (id atmosphere_family_safe) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id preference_funny) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id genre_comedy) (cf ?final-cf) (source "R43")))
   (printout t "FIRED R43: genre_comedy with CF " ?final-cf crlf)
)

(defrule R44
   (fact (id preference_action) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id atmosphere_party) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id genre_action) (cf ?final-cf) (source "R44")))
   (printout t "FIRED R44: genre_action with CF " ?final-cf crlf)
)

(defrule R45
   (fact (id preference_scifi) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id intellect_high) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id genre_scifi) (cf ?final-cf) (source "R45")))
   (printout t "FIRED R45: genre_scifi with CF " ?final-cf crlf)
)

(defrule R46
   (fact (id preference_serious) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id mood_sad) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id genre_drama) (cf ?final-cf) (source "R46")))
   (printout t "FIRED R46: genre_drama with CF " ?final-cf crlf)
)

(defrule R47
   (fact (id preference_action) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id time_short) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.7))
   (assert (fact (id genre_action) (cf ?final-cf) (source "R47")))
   (printout t "FIRED R47: genre_action with CF " ?final-cf crlf)
)

(defrule R48
   (fact (id preference_scifi) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id time_long) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.8))
   (assert (fact (id genre_scifi) (cf ?final-cf) (source "R48")))
   (printout t "FIRED R48: genre_scifi with CF " ?final-cf crlf)
)

(defrule R49
   (fact (id preference_serious) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id time_long) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.8))
   (assert (fact (id genre_drama) (cf ?final-cf) (source "R49")))
   (printout t "FIRED R49: genre_drama with CF " ?final-cf crlf)
)

(defrule R50
   (fact (id genre_horror) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id company_friends) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id niche_slasher) (cf ?final-cf) (source "R50")))
   (printout t "FIRED R50: niche_slasher with CF " ?final-cf crlf)
)

(defrule R51
   (fact (id genre_horror) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id company_alone) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.85))
   (assert (fact (id niche_psychological) (cf ?final-cf) (source "R51")))
   (printout t "FIRED R51: niche_psychological with CF " ?final-cf crlf)
)

(defrule R52
   (fact (id genre_comedy) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id time_short) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.8))
   (assert (fact (id niche_sitcom) (cf ?final-cf) (source "R52")))
   (printout t "FIRED R52: niche_sitcom with CF " ?final-cf crlf)
)

(defrule R53
   (fact (id genre_comedy) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id niche_black_comedy) (cf ?final-cf) (source "R53")))
   (printout t "FIRED R53: niche_black_comedy with CF " ?final-cf crlf)
)

(defrule R54
   (fact (id genre_scifi) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id genre_action) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id niche_space_opera) (cf ?final-cf) (source "R54")))
   (printout t "FIRED R54: niche_space_opera with CF " ?final-cf crlf)
)

(defrule R55
   (fact (id genre_scifi) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id intellect_high) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id niche_cyberpunk) (cf ?final-cf) (source "R55")))
   (printout t "FIRED R55: niche_cyberpunk with CF " ?final-cf crlf)
)

(defrule R56
   (fact (id genre_drama) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id time_long) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.8))
   (assert (fact (id niche_biography) (cf ?final-cf) (source "R56")))
   (printout t "FIRED R56: niche_biography with CF " ?final-cf crlf)
)

(defrule R57
   (fact (id genre_action) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id preference_funny) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.85))
   (assert (fact (id niche_superhero) (cf ?final-cf) (source "R57")))
   (printout t "FIRED R57: niche_superhero with CF " ?final-cf crlf)
)

(defrule R58
   (fact (id genre_animation) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id time_long) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id niche_classic_disney) (cf ?final-cf) (source "R58")))
   (printout t "FIRED R58: niche_classic_disney with CF " ?final-cf crlf)
)

(defrule R59
   (fact (id genre_animation) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id intellect_high) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.85))
   (assert (fact (id niche_anime) (cf ?final-cf) (source "R59")))
   (printout t "FIRED R59: niche_anime with CF " ?final-cf crlf)
)

(defrule R60
   (fact (id genre_fantasy) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id time_long) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.7))
   (assert (fact (id niche_classic_disney) (cf ?final-cf) (source "R60")))
   (printout t "FIRED R60: niche_classic_disney with CF " ?final-cf crlf)
)

(defrule R61
   (fact (id genre_fantasy) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id intellect_high) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.8))
   (assert (fact (id niche_anime) (cf ?final-cf) (source "R61")))
   (printout t "FIRED R61: niche_anime with CF " ?final-cf crlf)
)

(defrule R62
   (fact (id genre_documentary) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id time_long) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.7))
   (assert (fact (id niche_biography) (cf ?final-cf) (source "R62")))
   (printout t "FIRED R62: niche_biography with CF " ?final-cf crlf)
)

(defrule R63
   (fact (id genre_drama) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id mood_romantic) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.95))
   (assert (fact (id niche_romance_classic) (cf ?final-cf) (source "R63")))
   (printout t "FIRED R63: niche_romance_classic with CF " ?final-cf crlf)
)

(defrule R64
   (fact (id genre_comedy) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id company_partner) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.7))
   (assert (fact (id niche_sitcom) (cf ?final-cf) (source "R64")))
   (printout t "FIRED R64: niche_sitcom with CF " ?final-cf crlf)
)

(defrule R65
   (fact (id genre_action) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id company_alone) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.7))
   (assert (fact (id niche_cyberpunk) (cf ?final-cf) (source "R65")))
   (printout t "FIRED R65: niche_cyberpunk with CF " ?final-cf crlf)
)

(defrule R66
   (fact (id genre_action) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id company_friends) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id niche_superhero) (cf ?final-cf) (source "R66")))
   (printout t "FIRED R66: niche_superhero with CF " ?final-cf crlf)
)

(defrule R67
   (fact (id genre_drama) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id mood_sad) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.7))
   (assert (fact (id niche_biography) (cf ?final-cf) (source "R67")))
   (printout t "FIRED R67: niche_biography with CF " ?final-cf crlf)
)

(defrule R68
   (fact (id genre_scifi) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id time_short) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.6))
   (assert (fact (id niche_space_opera) (cf ?final-cf) (source "R68")))
   (printout t "FIRED R68: niche_space_opera with CF " ?final-cf crlf)
)

(defrule R69
   (fact (id genre_fantasy) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id company_kids) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id niche_classic_disney) (cf ?final-cf) (source "R69")))
   (printout t "FIRED R69: niche_classic_disney with CF " ?final-cf crlf)
)

(defrule R70
   (fact (id genre_action) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id niche_gangster) (cf ?final-cf) (source "R70")))
   (printout t "FIRED R70: niche_gangster with CF " ?final-cf crlf)
)

(defrule R71
   (fact (id genre_action) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id time_medium) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.85))
   (assert (fact (id niche_action_thriller) (cf ?final-cf) (source "R71")))
   (printout t "FIRED R71: niche_action_thriller with CF " ?final-cf crlf)
)

(defrule R72
   (fact (id genre_drama) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id intellect_high) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id niche_detective) (cf ?final-cf) (source "R72")))
   (printout t "FIRED R72: niche_detective with CF " ?final-cf crlf)
)

(defrule R73
   (fact (id genre_comedy) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id intellect_high) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id niche_aesthetic_comedy) (cf ?final-cf) (source "R73")))
   (printout t "FIRED R73: niche_aesthetic_comedy with CF " ?final-cf crlf)
)

(defrule R74
   (fact (id genre_horror) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id time_short) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.95))
   (assert (fact (id niche_short_horror) (cf ?final-cf) (source "R74")))
   (printout t "FIRED R74: niche_short_horror with CF " ?final-cf crlf)
)

(defrule R75
   (fact (id genre_horror) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id intellect_high) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id niche_elevated_horror) (cf ?final-cf) (source "R75")))
   (printout t "FIRED R75: niche_elevated_horror with CF " ?final-cf crlf)
)

(defrule R76
   (fact (id genre_scifi) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id time_short) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.8))
   (assert (fact (id niche_scifi_action) (cf ?final-cf) (source "R76")))
   (printout t "FIRED R76: niche_scifi_action with CF " ?final-cf crlf)
)

(defrule R77
   (fact (id genre_drama) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.85))
   (assert (fact (id niche_cult_drama) (cf ?final-cf) (source "R77")))
   (printout t "FIRED R77: niche_cult_drama with CF " ?final-cf crlf)
)

(defrule R78
   (fact (id genre_comedy) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id company_kids) (cf ?cf2&:(> ?cf2 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id niche_family_comedy) (cf ?final-cf) (source "R78")))
   (printout t "FIRED R78: niche_family_comedy with CF " ?final-cf crlf)
)

(defrule R79
   (fact (id niche_slasher) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.95))
   (assert (fact (id movie_scream) (cf ?final-cf) (source "R79")))
   (printout t "FIRED R79: movie_scream with CF " ?final-cf crlf)
)

(defrule R80
   (fact (id niche_slasher) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_halloween) (cf ?final-cf) (source "R80")))
   (printout t "FIRED R80: movie_halloween with CF " ?final-cf crlf)
)

(defrule R81
   (fact (id niche_psychological) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.95))
   (assert (fact (id movie_shutter_island) (cf ?final-cf) (source "R81")))
   (printout t "FIRED R81: movie_shutter_island with CF " ?final-cf crlf)
)

(defrule R82
   (fact (id niche_psychological) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_shining) (cf ?final-cf) (source "R82")))
   (printout t "FIRED R82: movie_shining with CF " ?final-cf crlf)
)

(defrule R83
   (fact (id niche_black_comedy) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_hangover) (cf ?final-cf) (source "R83")))
   (printout t "FIRED R83: movie_hangover with CF " ?final-cf crlf)
)

(defrule R84
   (fact (id niche_black_comedy) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.95))
   (assert (fact (id movie_pulp_fiction) (cf ?final-cf) (source "R84")))
   (printout t "FIRED R84: movie_pulp_fiction with CF " ?final-cf crlf)
)

(defrule R85
   (fact (id niche_black_comedy) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_in_bruges) (cf ?final-cf) (source "R85")))
   (printout t "FIRED R85: movie_in_bruges with CF " ?final-cf crlf)
)

(defrule R86
   (fact (id niche_gangster) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.95))
   (assert (fact (id movie_godfather) (cf ?final-cf) (source "R86")))
   (printout t "FIRED R86: movie_godfather with CF " ?final-cf crlf)
)

(defrule R87
   (fact (id niche_gangster) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_goodfellas) (cf ?final-cf) (source "R87")))
   (printout t "FIRED R87: movie_goodfellas with CF " ?final-cf crlf)
)

(defrule R88
   (fact (id niche_space_opera) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_child) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_star_wars) (cf ?final-cf) (source "R88")))
   (printout t "FIRED R88: movie_star_wars with CF " ?final-cf crlf)
)

(defrule R89
   (fact (id niche_space_opera) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_child) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.85))
   (assert (fact (id movie_guardians_galaxy) (cf ?final-cf) (source "R89")))
   (printout t "FIRED R89: movie_guardians_galaxy with CF " ?final-cf crlf)
)

(defrule R90
   (fact (id niche_cyberpunk) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.85))
   (assert (fact (id movie_blade_runner) (cf ?final-cf) (source "R90")))
   (printout t "FIRED R90: movie_blade_runner with CF " ?final-cf crlf)
)

(defrule R91
   (fact (id niche_cyberpunk) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_matrix) (cf ?final-cf) (source "R91")))
   (printout t "FIRED R91: movie_matrix with CF " ?final-cf crlf)
)

(defrule R92
   (fact (id niche_biography) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.95))
   (assert (fact (id movie_oppenheimer) (cf ?final-cf) (source "R92")))
   (printout t "FIRED R92: movie_oppenheimer with CF " ?final-cf crlf)
)

(defrule R93
   (fact (id niche_biography) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_social_network) (cf ?final-cf) (source "R93")))
   (printout t "FIRED R93: movie_social_network with CF " ?final-cf crlf)
)

(defrule R94
   (fact (id niche_biography) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_wolf_wallstreet) (cf ?final-cf) (source "R94")))
   (printout t "FIRED R94: movie_wolf_wallstreet with CF " ?final-cf crlf)
)

(defrule R95
   (fact (id niche_superhero) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_child) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_avengers) (cf ?final-cf) (source "R95")))
   (printout t "FIRED R95: movie_avengers with CF " ?final-cf crlf)
)

(defrule R96
   (fact (id niche_superhero) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.95))
   (assert (fact (id movie_dark_knight) (cf ?final-cf) (source "R96")))
   (printout t "FIRED R96: movie_dark_knight with CF " ?final-cf crlf)
)

(defrule R97
   (fact (id niche_classic_disney) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_child) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_short) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.95))
   (assert (fact (id movie_lion_king) (cf ?final-cf) (source "R97")))
   (printout t "FIRED R97: movie_lion_king with CF " ?final-cf crlf)
)

(defrule R98
   (fact (id niche_classic_disney) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_child) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_short) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.85))
   (assert (fact (id movie_shrek) (cf ?final-cf) (source "R98")))
   (printout t "FIRED R98: movie_shrek with CF " ?final-cf crlf)
)

(defrule R99
   (fact (id niche_classic_disney) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_child) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.85))
   (assert (fact (id movie_frozen) (cf ?final-cf) (source "R99")))
   (printout t "FIRED R99: movie_frozen with CF " ?final-cf crlf)
)

(defrule R100
   (fact (id niche_anime) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_child) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.95))
   (assert (fact (id movie_spirited_away) (cf ?final-cf) (source "R100")))
   (printout t "FIRED R100: movie_spirited_away with CF " ?final-cf crlf)
)

(defrule R101
   (fact (id niche_anime) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_ghost_in_shell) (cf ?final-cf) (source "R101")))
   (printout t "FIRED R101: movie_ghost_in_shell with CF " ?final-cf crlf)
)

(defrule R102
   (fact (id niche_space_opera) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.95))
   (assert (fact (id movie_interstellar) (cf ?final-cf) (source "R102")))
   (printout t "FIRED R102: movie_interstellar with CF " ?final-cf crlf)
)

(defrule R103
   (fact (id niche_space_opera) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_dune) (cf ?final-cf) (source "R103")))
   (printout t "FIRED R103: movie_dune with CF " ?final-cf crlf)
)

(defrule R104
   (fact (id niche_romance_classic) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.95))
   (assert (fact (id movie_titanic) (cf ?final-cf) (source "R104")))
   (printout t "FIRED R104: movie_titanic with CF " ?final-cf crlf)
)

(defrule R105
   (fact (id niche_romance_classic) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.95))
   (assert (fact (id movie_notebook) (cf ?final-cf) (source "R105")))
   (printout t "FIRED R105: movie_notebook with CF " ?final-cf crlf)
)

(defrule R106
   (fact (id niche_romance_classic) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_la_la_land) (cf ?final-cf) (source "R106")))
   (printout t "FIRED R106: movie_la_la_land with CF " ?final-cf crlf)
)

(defrule R107
   (fact (id niche_sitcom) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_child) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_home_alone) (cf ?final-cf) (source "R107")))
   (printout t "FIRED R107: movie_home_alone with CF " ?final-cf crlf)
)

(defrule R108
   (fact (id niche_sitcom) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_short) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_friends_episodes) (cf ?final-cf) (source "R108")))
   (printout t "FIRED R108: movie_friends_episodes with CF " ?final-cf crlf)
)

(defrule R109
   (fact (id niche_sitcom) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_short) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_office_episodes) (cf ?final-cf) (source "R109")))
   (printout t "FIRED R109: movie_office_episodes with CF " ?final-cf crlf)
)

(defrule R110
   (fact (id niche_gangster) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_snatch) (cf ?final-cf) (source "R110")))
   (printout t "FIRED R110: movie_snatch with CF " ?final-cf crlf)
)

(defrule R111
   (fact (id niche_action_thriller) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_john_wick) (cf ?final-cf) (source "R111")))
   (printout t "FIRED R111: movie_john_wick with CF " ?final-cf crlf)
)

(defrule R112
   (fact (id niche_action_thriller) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_mad_max_fury_road) (cf ?final-cf) (source "R112")))
   (printout t "FIRED R112: movie_mad_max_fury_road with CF " ?final-cf crlf)
)

(defrule R113
   (fact (id niche_action_thriller) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_heat) (cf ?final-cf) (source "R113")))
   (printout t "FIRED R113: movie_heat with CF " ?final-cf crlf)
)

(defrule R114
   (fact (id niche_detective) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_sherlock_holmes) (cf ?final-cf) (source "R114")))
   (printout t "FIRED R114: movie_sherlock_holmes with CF " ?final-cf crlf)
)

(defrule R115
   (fact (id niche_detective) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_zodiac) (cf ?final-cf) (source "R115")))
   (printout t "FIRED R115: movie_zodiac with CF " ?final-cf crlf)
)

(defrule R116
   (fact (id niche_detective) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_knives_out) (cf ?final-cf) (source "R116")))
   (printout t "FIRED R116: movie_knives_out with CF " ?final-cf crlf)
)

(defrule R117
   (fact (id niche_aesthetic_comedy) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.95))
   (assert (fact (id movie_grand_budapest) (cf ?final-cf) (source "R117")))
   (printout t "FIRED R117: movie_grand_budapest with CF " ?final-cf crlf)
)

(defrule R118
   (fact (id niche_aesthetic_comedy) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_french_dispatch) (cf ?final-cf) (source "R118")))
   (printout t "FIRED R118: movie_french_dispatch with CF " ?final-cf crlf)
)

(defrule R119
   (fact (id niche_short_horror) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_short) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_quiet_place) (cf ?final-cf) (source "R119")))
   (printout t "FIRED R119: movie_quiet_place with CF " ?final-cf crlf)
)

(defrule R120
   (fact (id niche_short_horror) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_short) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_zombieland) (cf ?final-cf) (source "R120")))
   (printout t "FIRED R120: movie_zombieland with CF " ?final-cf crlf)
)

(defrule R121
   (fact (id niche_elevated_horror) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_get_out) (cf ?final-cf) (source "R121")))
   (printout t "FIRED R121: movie_get_out with CF " ?final-cf crlf)
)

(defrule R122
   (fact (id niche_elevated_horror) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_midsommar) (cf ?final-cf) (source "R122")))
   (printout t "FIRED R122: movie_midsommar with CF " ?final-cf crlf)
)

(defrule R123
   (fact (id niche_elevated_horror) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_hereditary) (cf ?final-cf) (source "R123")))
   (printout t "FIRED R123: movie_hereditary with CF " ?final-cf crlf)
)

(defrule R124
   (fact (id niche_scifi_action) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_district_9) (cf ?final-cf) (source "R124")))
   (printout t "FIRED R124: movie_district_9 with CF " ?final-cf crlf)
)

(defrule R125
   (fact (id niche_scifi_action) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_edge_of_tomorrow) (cf ?final-cf) (source "R125")))
   (printout t "FIRED R125: movie_edge_of_tomorrow with CF " ?final-cf crlf)
)

(defrule R126
   (fact (id niche_slasher) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_short) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.85))
   (assert (fact (id movie_chucky) (cf ?final-cf) (source "R126")))
   (printout t "FIRED R126: movie_chucky with CF " ?final-cf crlf)
)

(defrule R127
   (fact (id niche_cult_drama) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_fight_club) (cf ?final-cf) (source "R127")))
   (printout t "FIRED R127: movie_fight_club with CF " ?final-cf crlf)
)

(defrule R128
   (fact (id niche_cult_drama) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_taxi_driver) (cf ?final-cf) (source "R128")))
   (printout t "FIRED R128: movie_taxi_driver with CF " ?final-cf crlf)
)

(defrule R129
   (fact (id niche_family_comedy) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_child) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.95))
   (assert (fact (id movie_paddington_2) (cf ?final-cf) (source "R129")))
   (printout t "FIRED R129: movie_paddington_2 with CF " ?final-cf crlf)
)

(defrule R130
   (fact (id niche_family_comedy) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_child) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.95))
   (assert (fact (id movie_inside_out) (cf ?final-cf) (source "R130")))
   (printout t "FIRED R130: movie_inside_out with CF " ?final-cf crlf)
)

(defrule R131
   (fact (id niche_superhero) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_child) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.95))
   (assert (fact (id movie_spider_verse) (cf ?final-cf) (source "R131")))
   (printout t "FIRED R131: movie_spider_verse with CF " ?final-cf crlf)
)

(defrule R132
   (fact (id niche_action_thriller) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_gladiator) (cf ?final-cf) (source "R132")))
   (printout t "FIRED R132: movie_gladiator with CF " ?final-cf crlf)
)

(defrule R133
   (fact (id niche_romance_classic) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_eternal_sunshine) (cf ?final-cf) (source "R133")))
   (printout t "FIRED R133: movie_eternal_sunshine with CF " ?final-cf crlf)
)

(defrule R134
   (fact (id niche_scifi_action) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.95))
   (assert (fact (id movie_terminator_2) (cf ?final-cf) (source "R134")))
   (printout t "FIRED R134: movie_terminator_2 with CF " ?final-cf crlf)
)

(defrule R135
   (fact (id niche_classic_disney) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_child) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.95))
   (assert (fact (id movie_wall_e) (cf ?final-cf) (source "R135")))
   (printout t "FIRED R135: movie_wall_e with CF " ?final-cf crlf)
)

(defrule R136
   (fact (id niche_slasher) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.85))
   (assert (fact (id movie_texas_chainsaw) (cf ?final-cf) (source "R136")))
   (printout t "FIRED R136: movie_texas_chainsaw with CF " ?final-cf crlf)
)

(defrule R137
   (fact (id niche_psychological) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_black_swan) (cf ?final-cf) (source "R137")))
   (printout t "FIRED R137: movie_black_swan with CF " ?final-cf crlf)
)

(defrule R138
   (fact (id niche_biography) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.85))
   (assert (fact (id movie_bohemian_rhapsody) (cf ?final-cf) (source "R138")))
   (printout t "FIRED R138: movie_bohemian_rhapsody with CF " ?final-cf crlf)
)

(defrule R139
   (fact (id niche_family_comedy) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_child) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_low) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.8))
   (assert (fact (id movie_minions) (cf ?final-cf) (source "R139")))
   (printout t "FIRED R139: movie_minions with CF " ?final-cf crlf)
)

(defrule R140
   (fact (id niche_detective) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_se7en) (cf ?final-cf) (source "R140")))
   (printout t "FIRED R140: movie_se7en with CF " ?final-cf crlf)
)

(defrule R141
   (fact (id niche_aesthetic_comedy) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_medium) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.9))
   (assert (fact (id movie_truman_show) (cf ?final-cf) (source "R141")))
   (printout t "FIRED R141: movie_truman_show with CF " ?final-cf crlf)
)

(defrule R142
   (fact (id niche_scifi_action) (cf ?cf1&:(> ?cf1 0.2)))
   (fact (id age_adult) (cf ?cf2&:(> ?cf2 0.2)))
   (fact (id time_long) (cf ?cf3&:(> ?cf3 0.2)))
   (fact (id intellect_high) (cf ?cf4&:(> ?cf4 0.2)))
   =>
   (bind ?min-cf (min ?cf1 ?cf2 ?cf3 ?cf4))
   (bind ?final-cf (* ?min-cf 0.95))
   (assert (fact (id movie_inception) (cf ?final-cf) (source "R142")))
   (printout t "FIRED R142: movie_inception with CF " ?final-cf crlf)
)

