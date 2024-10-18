PKG_VER=[gss]
GIT_URL=https://gitlab.freedesktop.org/mesa/mesa
GIT_COMMIT=d52a9d832e53b771c898b6ea1d223f7d68767d9a
LDFLAGS="-L$PREFIX/lib -landroid-shmem"

getVulkanDrivers() {
	if [ "$ARCHITECTURE" == "aarch64" ]; then
		echo "-Dvulkan-drivers=freedreno -Dfreedreno-kmds=kgsl,msm"
	elif [ "$ARCHITECTURE" == "x86_64" ]; then
		echo "-Dvulkan-drivers=amd"
	fi
}

MESON_ARGS="--cross-file=../../../meson-cross-file-$ARCHITECTURE -Dgallium-drivers=zink $(getVulkanDrivers) -Dglvnd=enabled -Dglx=dri -Dplatforms=x11 -Dxmlconfig=disabled -Dllvm=disabled -Dopengl=true -Degl=enabled -Dzstd=enabled"
