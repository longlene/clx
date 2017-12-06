
(defmethod asdf:perform :around ((op cffi-grovel::process-op)
                                 (file cffi-grovel::cc-flags-mixin))
  (declare (ignorable op))
  (let ((cffi-grovel::*cc-flags*
          (append (cffi-grovel::ensure-list (cffi-grovel::cc-flags-of file))
                  cffi-grovel::*cc-flags*)))
    (call-next-method)))
