#!/bin/bash

#    Author： 樂
#    github:  https://github.com/George-Hotz

GCC_COMPILER_PATH=/usr/bin/
C_COMPILER=${GCC_COMPILER_PATH}gcc
CXX_COMPILER=${GCC_COMPILER_PATH}g++

TARGET_ARCH=aarch64
TARGET_PLATFORM=linux

CURRENT_DIR=$(pwd)
BUILD_DIR=${CURRENT_DIR}/build/

if [[ ! -d "${BUILD_DIR}" ]]; then
  mkdir -p ${BUILD_DIR}
fi

cd ${BUILD_DIR}
cmake .. \
    -DCMAKE_SYSTEM_PROCESSOR=${TARGET_ARCH} \
    -DCMAKE_SYSTEM_NAME=Linux \
    -DCMAKE_C_COMPILER=${C_COMPILER} \
    -DCMAKE_CXX_COMPILER=${CXX_COMPILER} \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON

make -j8

cd ${CURRENT_DIR}

# DeepSeek-R1-Distill-Qwen-1.5B_FP16_RK3588.rkllm  --  权重FP16量化（内存占用更多，更精准）
# DeepSeek-R1-Distill-Qwen-1.5B_W8A8_RK3588.rkllm  --  权重和激活8bit量化（内存占用更少，更快）

./build/demo ./weights/DeepSeek-R1-Distill-Qwen-1.5B_W8A8_RK3588.rkllm 2048 4096