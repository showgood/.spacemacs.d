(require 'cal-china)

(defun holiday-lunar (lunar-month lunar-day string &optional num)
  "Like `holiday-fixed', but with LUNAR-MONTH and LUNAR-DAY.

When there are multiple days(like Run Yue or 闰月, e.g.,
2006-08-30, which is 07-07 in lunar calendar, the chinese
valentine's day), we use NUM to define which day(s) as
holidays. The rules are:

NUM = 0, only the earlier day.
NUM = 1, only the later day.
NUM with other values(default), all days(maybe one or two).

emacs23 introduces a similar `holiday-chinese', a quick test
shows that it does not recognize Run Yue at all."
  (unless (integerp num)
    (setq num 2))
  (let ((holiday (holiday-lunar-1 lunar-month lunar-day string num)))
    (when (and (= lunar-day 30)         ; Some months only have 29 days.
               (equal (holiday-lunar-1
                       (if (= lunar-month 12) 1 (1+ lunar-month)) 1 string num)
                      holiday))
      (setq holiday (holiday-lunar-1 lunar-month (1- lunar-day) string num)))
    holiday))

(defun holiday-lunar-1 (lunar-month lunar-day string &optional num)
  (let* ((cn-years (calendar-chinese-year
                    (if (eq displayed-month 12)
                        (1+ displayed-year)
                      displayed-year)))
         (ret (holiday-lunar-2
               (assoc lunar-month cn-years) lunar-day string)))
    (when (and (> (length cn-years) 12) (not (zerop num)))
      (let ((run-yue '())
            (years cn-years)
            (i '()))
        (while years
          (setq i (car years)
                years (cdr years))
          (unless (integerp (car i))
            (setq run-yue i)
            (setq years nil)))
        (when (= lunar-month (floor (car run-yue)))
          (setq ret (append ret (holiday-lunar-2
                                 run-yue lunar-day string))))))
    (cond ((= num 0)
           (when (car ret) (list (car ret))))
          ((= num 1)
           (if (cadr ret) (list (cadr ret)) ret))
          (t
           ret))))

(defun holiday-lunar-2 (run-yue lunar-day string)
  (let* ((date (calendar-gregorian-from-absolute
                (+ (cadr run-yue) (1- lunar-day))))
         (holiday (holiday-fixed (car date) (cadr date) string)))
    ;; Same year?
    (when (and holiday (= (nth 2 (caar holiday)) (nth 2 date)))
      holiday)))

;; (load "~/dotspacemacs/cal-china-x.el")
;; (require 'cal-china-x)
(setq mark-holidays-in-calendar t)

(setq other-holidays
      '((holiday-fixed 12 24 "picnic day")
        (holiday-fixed 12 28 "boxing day")
        (holiday-fixed 1 1 "元旦")
        ;; (holiday-solar-term "清明" "清明节")
        (holiday-fixed 5 1 "劳动节")
        (holiday-lunar 5 5 "端午节" 0)
        (holiday-lunar 8 15 "中秋节" 0)
        (holiday-fixed 10 1 "国庆节")
        (holiday-fixed 10 2 "国庆节")
        (holiday-fixed 10 3 "国庆节")
        ;; for some reason this doesn't produce correct result
        ;; has to use (holiday-lunar)
        ;; (holiday-chinese 12 30 "大年三十")
        (holiday-lunar 12 30 "大年三十" 0)
        (holiday-chinese 1 1 "大年初一")
        (holiday-chinese 1 2 "大年初二")
        (holiday-chinese 1 3 "大年初三")
        (holiday-chinese 1 15 "元宵节")
        (holiday-fixed 11 3 "melbourne cup race")
        (holiday-lunar 9 5 "Brother birthday" 0)
        (holiday-fixed 12 25 "christmas")))

(setq calendar-holidays
      (append general-holidays local-holidays other-holidays))
