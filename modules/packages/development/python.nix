{ config, pkgs, pkgs-unstable, lib, ... }:

{
  options = {
    python.enable = lib.mkEnableOption "Enable python tooling";
  };

  config = lib.mkIf config.python.enable {
    environment.systemPackages = with pkgs; [
        # Language plus pip & pkgs
        python313Full

        # Jupyter notebooks
        python313Packages.jupyter
        python313Packages.jupyterlab
        python313Packages.notebook
        python313Packages.pyzmq

        # editor
        pkgs-unstable.jetbrains.pycharm-professional
    ];
  };
}
