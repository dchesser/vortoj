(in-package :vortoj)

(defun pick (seq)
  "Pick a random element from a sequence."
  (elt seq (random (length seq))))

(defstruct language
  letter-groups
  syllable-structures
  orthography)

(defvar default-lang
  (make-language :letter-groups '((#\C . "ptkbdg") (#\R . "rl") (#\V . "ieaou"))
		 :syllable-structures '("CV" "V" "CRV")
		 :orthography '(("ki" . "či"))))

(defmethod random-letter ((lang language) group)
  "Select a random letter from a character GROUP."
  (pick (cdr (assoc (char-upcase group) (language-letter-groups lang)))))

(defmethod generate-syllable ((lang language) &optional structure)
  "Generate a random syllable from a LANGUAGE.

If STRUCTURE is a string, then generate a syllable using
each character as a key to each letter group."
  (let ((struct (or structure
		    (pick (language-syllable-structures lang)))))
    (coerce (loop for group across struct
	       collect (or (random-letter lang group))) 'string)))

(defmethod generate-word ((lang language) syllables)
  "Generate a random word from a LANG that is SYLLABLES long."
  (apply #'concatenate 'string (loop repeat syllables
				  collect (generate-syllable lang))))

