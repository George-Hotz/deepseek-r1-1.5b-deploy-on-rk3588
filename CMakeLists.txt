#    Author： 樂
#    github:  https://github.com/George-Hotz

# 设置最低版本号
cmake_minimum_required(VERSION 3.10)

# 设置项目名称
project(rkllm_demo)

# 输出系统信息
message(STATUS "System: ${CMAKE_SYSTEM_NAME} ${CMAKE_SYSTEM_VERSION}")

# 设置编译器
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 设置库架构
set(LIB_ARCH "aarch64")
set(DEVICE_NAME "RK3588")

#  rkllm_api 文件夹路径
set(RKLLM_API_PATH ${CMAKE_CURRENT_SOURCE_DIR}/lib/librkllm_api)
#  rkllm_api include 路径
set(RKLLM_API_INCLUDE_PATH ${RKLLM_API_PATH}/include)
#  rkllm_api lib 路径
set(RKLLM_API_LIB_PATH ${RKLLM_API_PATH}/${LIB_ARCH}/librkllmrt.so)


# 用来搜索头文件的目录
include_directories(
    ${RKLLM_API_INCLUDE_PATH}
)

set(SOURCE src/rkllm.cpp)
add_executable(demo ${SOURCE})

# 链接库
target_link_libraries(demo  
    ${RKLLM_API_LIB_PATH}
)
