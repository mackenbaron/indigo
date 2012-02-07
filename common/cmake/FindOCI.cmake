# Locate oci
# This module defines
# OCI_LIBRARY_DIRS
# OCI_INCLUDE_DIRS, where to find the headers
#

FIND_PATH(OCI_INCLUDE_DIRS oci.h
    $ENV{ORACLE_HOME}/rdbms/public/
)

IF (WIN32)
  SET(LIBORASDK "orasdk.lib")
ELSEIF(UNIX)
  SET(LIBORASDK "liborasdk.so")
ELSEIF(APPLE)
  SET(LIBORASDK "liborasdk.dylib")
ENDIF()

FIND_PATH(OCI_LIBRARY_DIRS ${LIBORASDK}
    $ENV{ORACLE_HOME}/lib
)

SET(OCI_FOUND "NO")
IF(OCI_LIBRARY_DIRS AND OCI_INCLUDE_DIRS)
    SET(OCI_FOUND "YES")
ENDIF(OCI_LIBRARY_DIRS AND OCI_INCLUDE_DIRS)
