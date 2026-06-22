# Gentoo LLVM 22 ships only libLLVM.so (dylib mode); LLVM_DYLIB_COMPONENTS=all
# means every component is bundled. Override llvm_map_components_to_libnames
# so it returns an empty list — the individual .a archives no longer exist and
# linking against libLLVM.so (already pulled in transitively) is sufficient.
if(DEFINED LLVM_DYLIB_COMPONENTS AND "${LLVM_DYLIB_COMPONENTS}" STREQUAL "all")
  function(llvm_map_components_to_libnames out_libs)
    set(${out_libs} "" PARENT_SCOPE)
  endfunction()
endif()

# Gentoo builds MLIR as a monolithic shared library (libMLIR.so).
# onnx-mlir expects individual component targets. Create INTERFACE aliases.
if(TARGET MLIR)
  foreach(_mlir_comp
    MLIRAffineDialect
    MLIRAffineToStandard
    MLIRAffineTransforms
    MLIRAffineUtils
    MLIRArithDialect
    MLIRArithToLLVM
    MLIRArithTransforms
    MLIRBufferizationDialect
    MLIRBufferizationPipelines
    MLIRBufferizationToMemRef
    MLIRBufferizationTransforms
    MLIRBuiltinToLLVMIRTranslation
    MLIRDialect
    MLIRFuncDialect
    MLIRFuncToLLVM
    MLIRFuncTransforms
    MLIRInferTypeOpInterface
    MLIRIR
    MLIRLinalgDialect
    MLIRLinalgTransforms
    MLIRLLVMCommonConversion
    MLIRLLVMIRTransforms
    MLIRLLVMToLLVMIRTranslation
    MLIRLspServerLib
    MLIRMathDialect
    MLIRMathToLLVM
    MLIRMathTransforms
    MLIRMemRefDialect
    MLIRMemRefToLLVM
    MLIRMemRefTransforms
    MLIROpenMPDialect
    MLIROpenMPToLLVM
    MLIROpenMPToLLVMIRTranslation
    MLIROptLib
    MLIRPass
    MLIRQuantDialect
    MLIRReconcileUnrealizedCasts
    MLIRReduceLib
    MLIRRewrite
    MLIRSCFDialect
    MLIRSCFToControlFlow
    MLIRSCFToOpenMP
    MLIRShapeDialect
    MLIRShapeToStandard
    MLIRSupport
    MLIRTensorDialect
    MLIRTosaDialect
    MLIRTransforms
    MLIRTransformUtils
    MLIRUBToLLVM
    MLIRVectorDialect
    MLIRVectorToLLVMPass
    MLIRViewLikeInterface
    MLIRLLVMDialect
    MLIRTargetLLVMIRExport
    MLIRTargetLLVMIRImport
    MLIRAnalysis
    MLIRBytecodeReader
    MLIRBytecodeWriter
    MLIRCastInterfaces
    MLIRCallInterfaces
    MLIRControlFlowDialect
    MLIRControlFlowToLLVM
    MLIRSideEffectInterfaces
    MLIRTranslateLib
  )
    if(NOT TARGET ${_mlir_comp})
      add_library(${_mlir_comp} INTERFACE IMPORTED)
      set_property(TARGET ${_mlir_comp} PROPERTY
        INTERFACE_LINK_LIBRARIES MLIR LLVM)
    endif()
  endforeach()
endif()
