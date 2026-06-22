import pathlib
f = pathlib.Path("CMakeLists.txt")
t = f.read_text()
t = t.replace(
    'if (NOT "${CMAKE_GENERATOR}" MATCHES "Xcode")',
    'if (NOT "${CMAKE_GENERATOR}" MATCHES "Xcode" AND NOT AVM_BUILD_RUNTIME_ONLY)',
)
f.write_text(t)
