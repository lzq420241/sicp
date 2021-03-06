(define (aa query)
  (add-rule-or-assertion!
   (add-assertion-body
    (query-syntax-process (list 'assert! query)))))

(aa '(address (Bitdiddle Ben) (Slumerville (Ridge Road) 10)))
(aa '(job (Bitdiddle Ben) (computer wizard)))
(aa '(salary (Bitdiddle Ben) 60000))
(aa '(supervisor (Bitdiddle Ben) (Warbucks Oliver)))

(aa '(address (Hacker Alyssa P) (Cambridge (Mass Ave) 78)))
(aa '(job (Hacker Alyssa P) (computer programmer)))
(aa '(salary (Hacker Alyssa P) 40000))
(aa '(supervisor (Hacker Alyssa P) (Bitdiddle Ben)))

(aa '(address (Fect Cy D) (Cambridge (Ames Street) 3)))
(aa '(job (Fect Cy D) (computer programmer)))
(aa '(salary (Fect Cy D) 35000))
(aa '(supervisor (Fect Cy D) (Bitdiddle Ben)))

(aa '(address (Tweakit Lem E) (Boston (Bay State Road) 22)))
(aa '(job (Tweakit Lem E) (computer technician)))
(aa '(salary (Tweakit Lem E) 25000))
(aa '(supervisor (Tweakit Lem E) (Bitdiddle Ben)))

(aa '(address (Reasoner Louis) (Slumerville (Pine Tree Road) 80)))
(aa '(job (Reasoner Louis) (computer programmer trainee)))
(aa '(salary (Reasoner Louis) 30000))
(aa '(supervisor (Reasoner Louis) (Hacker Alyssa P)))

(aa '(address (Warbucks Oliver) (Swellesley (Top Heap Road))))
(aa '(job (Warbucks Oliver) (administration big wheel)))
(aa '(salary (Warbucks Oliver) 150000))

(aa '(address (Scrooge Eben) (Weston (Shady Lane) 10)))
(aa '(job (Scrooge Eben) (accounting chief accountant)))
(aa '(salary (Scrooge Eben) 75000))
(aa '(supervisor (Scrooge Eben) (Warbucks Oliver)))

(aa '(address (Cratchet Robert) (Allston (N Harvard Street) 16)))
(aa '(job (Cratchet Robert) (accounting scrivener)))
(aa '(salary (Cratchet Robert) 18000))
(aa '(supervisor (Cratchet Robert) (Scrooge Eben)))

(aa '(address (Aull DeWitt) (Slumerville (Onion Square) 5)))
(aa '(job (Aull DeWitt) (administration secretary)))
(aa '(salary (Aull DeWitt) 25000))
(aa '(supervisor (Aull DeWitt) (Warbucks Oliver)))

(aa '(can-do-job (computer wizard) (computer programmer)))
(aa '(can-do-job (computer wizard) (computer technician)))
(aa '(can-do-job (computer programmer) (computer programmer trainee)))


(aa '(rule (same ?x ?x)))
(aa '(rule (lives-near ?x ?y)
	   (and (address ?x (?town . ?street-of-x))
		(address ?y (?town . ?street-of-y))
		(not (same ?x ?y)))))
(aa '(rule (wheel ?person)
	   (and (supervisor ?underling ?person)
		(supervisor ?whelp ?underling))))
(aa '(rule (outranked-by ?underling ?boss)
	   (or (supervisor ?underling ?boss)
	       (and (supervisor ?underling ?lieutenant)
		    (outranked-by ?lieutenant ?boss)))))
(aa '(rule (replace ?a ?b)
	   (and (job ?a ?more)
		(job ?b ?less)
		(or (same ?more ?less)
		    (can-do-job ?more ?less))
		(not (same ?a ?b)))))

;; A big-shot is somebody who does not have a supervisor in their
;; department
(aa '(rule (big-shot ?person ?department)
	   (and (job ?person (?department . ?x))
		(not (and (supervisor ?person ?boss)
			  (job ?boss (?department . ?y)))))))


(aa '(meeting acoounting (monday 9am)))
(aa '(meeting administration (monday 10am)))
(aa '(meeting computer (wednesday 3pm)))
(aa '(meeting administration (friday 1pm)))
(aa '(meeting whole-company (wednesday 4pm)))

(aa '(rule (meeting-time ?person ?day-and-time)
	   (or (and (meeting ?division ?day-and-time)
		    (job ?person (?division . ?ignore)))
	       (meeting whole-company ?day-and-time))))

(aa '(rule (append-to-form () ?x ?x)))
(aa '(rule (append-to-form (?u . ?v) ?y (?u . ?z))
	   (append-to-form ?v ?y ?z)))
