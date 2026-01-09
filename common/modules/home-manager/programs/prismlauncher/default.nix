{pkgs,...}:
{
  home.packages = [
    (pkgs.prismlauncher.override {
      jdks = [
        pkgs.jdk25
        pkgs.jdk21
      ];    
    })
  ];
}
