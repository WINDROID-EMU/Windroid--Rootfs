GIT_URL=https://github.com/ptitSeb/box64
# Use a última versão estável, ou um commit específico para maior compatibilidade com x86_64.
GIT_COMMIT=6cbcfc7ab80269a0d3b80ec920fa344f59609b61

# Flags otimizadas para dispositivos Android com processador Snapdragon (ARMv8-A)
CMAKE_ARGS="
  -DANDROID=1 \
  -DBAD_SIGNAL=1 \
  -DARM_DYNAREC=1 \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DNOALIGN=1 \ # Melhora a compatibilidade com código não alinhado
  -DUSE_BLOBS=1 \ # Ativa o uso de blobs para melhorar a performance em jogos
  -DANDROID_ARM_NEON=ON \ # Habilita instruções NEON específicas do ARM
  -DUSE_VFP_HARD=ON \ # Otimiza o uso da FPU (Floating Point Unit) em ARM
  -DPROFILE=1 \ # Habilita profiling para ver quais partes do código podem ser otimizadas
  -DSDL2=ON \ # Suporte a SDL2 para melhorar a compatibilidade gráfica com jogos
  -DUSE_OPENGL_ES=1 \ # Habilita OpenGL ES para melhor desempenho gráfico em Android
  -DUSE_VULKAN=ON \ # Suporte a Vulkan, que é eficiente para GPUs Adreno em Snapdragon
  -DVULKAN_USE_ARM_FRAMEBUFFER=ON \ # Otimiza Vulkan para a GPU Adreno
"

# Mantém a exclusão de x86_64, já que o alvo aqui é rodar jogos x86_64 em ARM64.
BLACKLIST_ARCHITECTURE=x86_64