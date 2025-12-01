;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Functional Programming Project - Team Skeleton
;; 
;; Team Members:
;;   Person 1: Set Operations Foundation (set-member, set-union)
;;   Person 2: Advanced Set Operations (set-intersection, set-diff)
;;   Person 3: Boolean Logic Operators (boolean-xor, boolean-implies, boolean-iff)
;;   Person 4: Complex Functions (boolean-eval, merge-sort)
;;
;; Allowed constructs: T, NIL, IF, WHEN, COND, NOT, AND, OR, EQUAL, CONS, LIST,
;;                     CAR, CDR, FIRST, SECOND, THIRD, LENGTH, DEFUN, LABELS,
;;                     LET, LET*, FUNCALL, QUOTE, arithmetic operators
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PERSON 1: SET OPERATIONS FOUNDATION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Return T if item is a member of set.
;; Return NIL if item is not a member of set.
;; The type of set is list.
;;
;; HINT: Use recursion. Base case: empty list returns NIL
;;       Recursive case: check if item equals (car set), 
;;       otherwise recurse on (cdr set)
;;
;; Examples:
;;   (set-member '(1 2) 1) => T
;;   (set-member '(1 2) 3) => NIL
(defun set-member (set item)
  ;; TODO: Implement recursive membership check
  ;; Base case: (if (not set) nil ...)
  ;; Recursive: check (equal (car set) item) or recurse
  )

;; Return the union of set-1 and set-2.
;; The result should contain no duplicates.
;; Assume set-1 contains no duplicates and set-2 contains no duplicates.
;;
;; HINT: Start with set-1, then add elements from set-2 that aren't 
;;       already in set-1. Use set-member to check membership.
;;
;; Examples:
;;   (set-union '(1 2) '(2 4)) => '(1 2 4)
(defun set-union (set-1 set-2)
  ;; TODO: Implement union
  ;; Consider using a helper function with recursion
  ;; For each element in set-2, check if it's in set-1
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PERSON 2: ADVANCED SET OPERATIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun set-intersection (set-1 set-2)
  (cond
    ((null set-1) nil)

    ((set-member set-2 (car set-1))
     (cons (car set-1)
           (set-intersection (cdr set-1) set-2)))

    (t (set-intersection (cdr set-1) set-2))))

(defun set-diff (set-1 set-2)
  (cond
    ((null set-1) nil)

    ((not (set-member set-2 (car set-1)))
     (cons (car set-1)
           (set-diff (cdr set-1) set-2)))

    (t (set-diff (cdr set-1) set-2))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PERSON 3: BOOLEAN LOGIC OPERATORS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Return the exclusive or of a and b
;;
;; HINT: XOR is true when inputs differ
;;       Truth table: T XOR NIL = T, NIL XOR T = T, 
;;                    T XOR T = NIL, NIL XOR NIL = NIL
;;       Can use: (and (or a b) (not (and a b)))
;;       Or: (not (equal a b))
;;
;; Examples:
;;   (boolean-xor t nil) => T
;;   (boolean-xor nil nil) => NIL
(defun boolean-xor (a b)
  ;; TODO: Implement XOR
  )

;; Return the implication of a and b
;;
;; HINT: A implies B is equivalent to (not A) or B
;;       Truth table: T => NIL = NIL, all others = T
;;       "If A then B" is false only when A is true and B is false
;;
;; Examples:
;;   (boolean-implies t nil) => NIL
;;   (boolean-implies nil nil) => T
(defun boolean-implies (a b)
  ;; TODO: Implement implication
  ;; Use: (or (not a) b)
  )

;; Return the bi-implication (if and only if) of a and b
;;
;; HINT: IFF is true when both inputs are the same
;;       A iff B means (A implies B) and (B implies A)
;;       Or simply: (equal a b)
;;
;; Examples:
;;   (boolean-iff t nil) => NIL
;;   (boolean-iff nil nil) => T
(defun boolean-iff (a b)
  ;; TODO: Implement bi-implication
  ;; Either use (and (boolean-implies a b) (boolean-implies b a))
  ;; Or: (equal a b)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PERSON 4: COMPLEX FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Evaluate a boolean expression.
;; Handle NOT, AND, OR, XOR, IMPLIES, and IFF.
;;
;; HINT: This is a recursive evaluator. Check if exp is an atom (T/NIL)
;;       or a list. If list, (car exp) is the operator.
;;       Structure: (cond 
;;                    ((equal exp t) t)
;;                    ((equal exp nil) nil)
;;                    ((equal (car exp) 'not) ...)
;;                    ((equal (car exp) 'and) ...)
;;                    ...)
;;       Recursively evaluate subexpressions!
;;
;; Examples:
;;   (boolean-eval '(and t nil)) => NIL
;;   (boolean-eval '(and t (or nil t))) => T
(defun boolean-eval (exp)
  ;; Evaluate a boolean expression recursively
  ;; Base cases: T and NIL evaluate to themselves
  ;; Recursive cases: extract operator and operands, evaluate recursively
  (cond
    ;; Base case: T evaluates to T
    ((equal exp t) t)
    ;; Base case: NIL evaluates to NIL
    ((equal exp nil) nil)
    ;; NOT operator: recursively evaluate the operand and apply NOT
    ((equal (car exp) 'not)
     (not (boolean-eval (second exp))))
    ;; AND operator: recursively evaluate both operands and apply AND
    ((equal (car exp) 'and)
     (and (boolean-eval (second exp)) (boolean-eval (third exp))))
    ;; OR operator: recursively evaluate both operands and apply OR
    ((equal (car exp) 'or)
     (or (boolean-eval (second exp)) (boolean-eval (third exp))))
    ;; XOR operator: recursively evaluate both operands and apply XOR
    ((equal (car exp) 'xor)
     (boolean-xor (boolean-eval (second exp)) (boolean-eval (third exp))))
    ;; IMPLIES operator: recursively evaluate both operands and apply IMPLIES
    ((equal (car exp) 'implies)
     (boolean-implies (boolean-eval (second exp)) (boolean-eval (third exp))))
    ;; IFF operator: recursively evaluate both operands and apply IFF
    ((equal (car exp) 'iff)
     (boolean-iff (boolean-eval (second exp)) (boolean-eval (third exp))))))

;; Perform merge sort on a list.
;; Parameters:
;;   list: The list to sort
;;   predicate: A function to compare elements of the list
;;
;; HINT: Merge sort has 3 parts:
;;       1. Base case: lists of length 0 or 1 are already sorted
;;       2. Split: divide list into two halves
;;       3. Merge: recursively sort each half, then merge them
;;
;;       Use LABELS to define helper functions:
;;       - split-list: divide list into two roughly equal parts
;;       - merge-lists: merge two sorted lists using predicate
;;
;; Examples:
;;   (merge-sort '(2 1 5 0) #'<) => '(0 1 2 5)
;;   (merge-sort '(2 1 5 0) #'>) => '(5 2 1 0)
(defun merge-sort (list predicate)
  ;; Merge sort implementation using divide-and-conquer
  (labels ((split-list (lst)
             ;; Split list into two halves by alternating elements
             ;; Returns (first-half second-half)
             (if (or (not lst) (not (cdr lst)))
                 (list lst nil)
                 (let ((rest-split (split-list (cdr (cdr lst)))))
                   (list (cons (car lst) (car rest-split))
                         (cons (second lst) (second rest-split))))))
           (merge-lists (left right)
             ;; Merge two sorted lists using the predicate
             (cond
               ((not left) right)
               ((not right) left)
               ((funcall predicate (car left) (car right))
                (cons (car left) (merge-lists (cdr left) right)))
               (t
                (cons (car right) (merge-lists left (cdr right)))))))
    ;; Main merge-sort logic
    (cond
      ((not list) nil)
      ((not (cdr list)) list)
      (t (let* ((halves (split-list list))
                (left-half (car halves))
                (right-half (second halves))
                (sorted-left (merge-sort left-half predicate))
                (sorted-right (merge-sort right-half predicate)))
           (merge-lists sorted-left sorted-right))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; END OF PROJECT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;