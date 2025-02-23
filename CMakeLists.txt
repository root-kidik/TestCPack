cmake_minimum_required(VERSION 3.25)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

include(Config)

project(TestCPack VERSION 0.0.1)

add_executable(${PROJECT_NAME} Main.cpp)

include(Install)
include(Packaging)
