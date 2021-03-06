# Try to find libhpdf (*shared* libHaru PDF library)
# Once done this will define
#
#  LIBHPDF_FOUND - system has libhpdf
#  LIBHPDF_INCLUDE_DIRS - the libhpdf include directory
#  LIBHPDF_LIBRARIES - Link these to use libhpdf
#
#  Adapted from cmake-modules Google Code project
#
#  Copyright (c) 2006 Andreas Schneider <mail@cynapses.org>
#
#  (Changes for libhpdf) Copyright (c) 2013 CompuPhase
#
# Redistribution and use is allowed according to the terms of the New BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.
#


if (LIBHPDF_LIBRARIES AND LIBHPDF_INCLUDE_DIRS)
  # in cache already
  set(LIBHPDF_FOUND TRUE)
else (LIBHPDF_LIBRARIES AND LIBHPDF_INCLUDE_DIRS)
  find_path(LIBHPDF_INCLUDE_DIR
    NAMES
    hpdf.h
    PATHS
    /usr/include
    /usr/local/include
    /opt/local/include
    /sw/include
    )

  SET(HPDF_LIBNAME hpdf)
  find_library(LIBHPDF_LIBRARY
    NAMES
    ${HPDF_LIBNAME}
    PATHS
    /usr/lib
    /usr/local/lib
    /opt/local/lib
    /sw/lib
    /usr/lib64
    /usr/local/lib64
    /opt/local/lib64
    /sw/lib64
    )

  if(LIBHPDF_INCLUDE_DIR)
    set(LIBHPDF_INCLUDE_DIRS
      ${LIBHPDF_INCLUDE_DIR}
      )
  endif(LIBHPDF_INCLUDE_DIR)
  set(LIBHPDF_LIBRARIES
    ${LIBHPDF_LIBRARY}
    )

  if (LIBHPDF_INCLUDE_DIRS AND LIBHPDF_LIBRARIES)
    set(LIBHPDF_FOUND TRUE)
  endif (LIBHPDF_INCLUDE_DIRS AND LIBHPDF_LIBRARIES)

  if (LIBHPDF_FOUND)
    if (NOT libhpdf_FIND_QUIETLY)
      message(STATUS "Found libhpdf: ${LIBHPDF_LIBRARIES}")
    endif (NOT libhpdf_FIND_QUIETLY)
  else (LIBHPDF_FOUND)
    if (libhpdf_FIND_REQUIRED)
      message(FATAL_ERROR "Could not find libhpdf")
    endif (libhpdf_FIND_REQUIRED)
  endif (LIBHPDF_FOUND)

  # show the LIBHPDF_INCLUDE_DIRS and LIBHPDF_LIBRARIES variables only in the advanced view
  mark_as_advanced(LIBHPDF_INCLUDE_DIRS LIBHPDF_LIBRARIES)

endif (LIBHPDF_LIBRARIES AND LIBHPDF_INCLUDE_DIRS)