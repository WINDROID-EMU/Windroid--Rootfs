PKG_VER=[gss]
GIT_URL=https://gitlab.freedesktop.org/mesa/mesa
GIT_COMMIT=5f70858ece37144e87574767769ca3aa7057d0c2
LDFLAGS="-L$PREFIX/lib -landroid-shmem"
CPPFLAGS="-D__USE_GNU"
MESON_ARGS="-Dgallium-drivers= -Dvulkan-drivers=freedreno -Dfreedreno-kmds=kgsl,msm -Dglvnd=disabled -Dplatforms=x11 -Dxmlconfig=disabled -Dllvm=disabled -Dopengl=false -Degl=disabled -Dzstd=enabled"
