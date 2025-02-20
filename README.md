# RK3588部署DeepSeek-R1-1.5B蒸馏模型
- 以下两者方式均可，选择一种

## 1、运行以下脚本即可
`./build.sh`

## 2、分步执行
### Step1 cmake编译工程
`cmake -S . -B build`

### Step2 build工程
`cmake --build build`

### Step3: 推理部署
`./build/demo ./weights/DeepSeek-R1-Distill-Qwen-1.5B_W8A8_RK3588.rkllm 2048 4096`

# 参考
- [💡瑞芯微-RKLLM-大语言模型-GitHub](https://github.com/airockchip/rknn-llm?tab=readme-ov-file)