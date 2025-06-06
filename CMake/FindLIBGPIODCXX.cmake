# Usage:
#
# if (LIBGPIODCXX_FOUND)
#    target_link_libraries(MyTarget LIBGPIODCXX::LIBGPIODCXX)
# endif()

find_path(LIBGPIODCXX_INCLUDE_DIR gpiod.hpp)
find_library(LIBGPIODCXX_LIBRARY NAMES gpiodcxx)
include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(
  LIBGPIODCXX
  FOUND_VAR LIBGPIODCXX_FOUND
  REQUIRED_VARS LIBGPIODCXX_LIBRARY LIBGPIODCXX_INCLUDE_DIR
)

message(STATUS "libgpiodcxx include dir: ${LIBGPIODCXX_INCLUDE_DIR}")
message(STATUS "libgpiodcxx: ${LIBGPIODCXX_LIBRARY}")
set(LIBGPIODCXX_LIBRARIES ${LIBGPIODCXX_LIBRARY})

mark_as_advanced(LIBGPIODCXX_LIBRARY LIBGPIODCXX_INCLUDE_DIR)

add_library(LIBGPIODCXX::LIBGPIODCXX INTERFACE IMPORTED)
target_link_libraries(LIBGPIODCXX::LIBGPIODCXX INTERFACE ${LIBGPIODCXX_LIBRARIES})
target_include_directories(LIBGPIODCXX::LIBGPIODCXX INTERFACE ${LIBGPIODCXX_INCLUDE_DIR})
