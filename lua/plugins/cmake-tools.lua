require("cmake-tools").setup({
  cmake_command = "cmake",
  cmake_regenerate_on_save = true,
  cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
  cmake_build_directory = "build",      -- или "build/${variant:buildType}"
  cmake_kits_path = nil,                -- если пользуетесь CMake Kits
  cmake_soft_link_compile_commands = true,
  cmake_executor = { name = "overseer" } -- задачи через overseer
})
