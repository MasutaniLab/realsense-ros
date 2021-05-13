set(realsense2_INC_SEARCH_PATH /usr/local/include)
set(realsense2_LIB_SEARCH_PATH /usr/local/lib)

if(MSVC)
  list(APPEND realsense2_INC_SEARCH_PATH "C:/librealsense2/include")

  list(APPEND realsense2_INC_SEARCH_PATH $ENV{REALSENSE2_HOME}/include)
  list(APPEND realsense2_INC_SEARCH_PATH $ENV{REALSENSE2_DIR}/include)
  list(APPEND realsense2_INC_SEARCH_PATH "C:/Program Files (x86)/Intel RealSense SDK 2.0/include")

  list(APPEND realsense2_LIB_SEARCH_PATH $ENV{REALSENSE2_HOME}/lib)
  list(APPEND realsense2_LIB_SEARCH_PATH $ENV{REALSENSE2_DIR}/lib)
  
  if(CMAKE_CL_64)
    list(APPEND realsense2_LIB_SEARCH_PATH "C:/Program Files (x86)/Intel RealSense SDK 2.0/lib/x64")
  else()
    list(APPEND realsense2_LIB_SEARCH_PATH "C:/Program Files (x86)/Intel RealSense SDK 2.0/lib/x86")
  endif()
else()
  list(APPEND realsense2_INC_SEARCH_PATH /usr/include)
  list(APPEND realsense2_LIB_SEARCH_PATH /usr/lib)

  list(APPEND realsense2_INC_SEARCH_PATH $ENV{REALSENSE2_HOME}/include)
  list(APPEND realsense2_LIB_SEARCH_PATH $ENV{REALSENSE2_HOME}/lib)
  list(APPEND realsense2_INC_SEARCH_PATH $ENV{REALSENSE2_DIR}/include)
  list(APPEND realsense2_LIB_SEARCH_PATH $ENV{REALSENSE2_DIR}/lib)
endif()

find_path(realsense2_INCLUDE_DIRS librealsense2/rs.hpp
  PATHS
    ${realsense2_INC_SEARCH_PATH}
)

find_library(realsense2_LIBRARIES
  NAMES realsense2
  PATHS
    ${realsense2_LIB_SEARCH_PATH}
)

if(realsense2_LIBRARIES AND realsense2_INCLUDE_DIRS)
  set(realsense2_FOUND TRUE)
else()
  set(realsense2_FOUND FALSE)
endif()
  
mark_as_advanced(
  realsense2_INCLUDE_DIRS
  realsense2_LIBRARIES
  realsense2_INC_SEARCH_PATH
  realsense2_LIB_SEARCH_PATH
)
