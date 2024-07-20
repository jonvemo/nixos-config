{ pkgs, ...}:

{
  programs = {
  
    hyprland = {
      enable = true;
      xwayland.enable = true; # NOTE Es requerido para Steam, consume cerca de 87MB
    };

    java = {
      enable = true;
      package = pkgs.jdk22;
    };

    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    fish = {
      enable = true;
      # NOTE Para Helix-GPT
      interactiveShellInit = ''
        set -gx HANDLER codeium
      '';
      
      shellAliases = {
        npro = "cd /etc/nixos/modules/nixos/programs & sudo hx default.nix";

        npac = "cd /etc/nixos/modules/nixos/packages & sudo hx default.nix";
        hpac = "cd /etc/nixos/modules/home-manager/packages & sudo hx default.nix";

        flake = "cd /etc/nixos/ & sudo hx flake.nix";
        jconfig = "cd /etc/nixos/hosts/jonvemo & sudo hx configuration.nix";
        jhome = "cd /etc/nixos/hosts/jonvemo & sudo hx home.nix";

        sd = "sudo hx default.nix";

        # Git                                                      # DUMB NOTES
        gi = "git init";
        ga = "git add";
        gaa = "git add --all";                                     # NOTE Añade todos los cambios en el repositorio al área de preparación
        gco = "git checkout";                                      # NOTE Cambia de rama
        
        gc = "git commit --verbose";                               # NOTE Crea un commit y muestra el diff de los cambios
        gca = "git commit --verbose --all";                        # NOTE Añade todos los cambios y crea un commit mostrando el diff
        gcaamd = "git commit --verbose --all --amend";             # NOTE Añade todos los cambios y modifica el último commit sin cambiar el mensaje
        gcanamd = "git commit --verbose --all --no-edit --amend";  # NOTE Añade todos los cambios y modifica el último commit sin cambiar el mensaje
        gcamd = "git commit --verbose --amend";                    # NOTE Modifica el último commit y muestra el diff de los cambios
        gcn = "git commit --verbose --no-edit --amend";            # NOTE Modifica el último commit sin cambiar el mensaje
        
        gd = "git diff";                                           # NOTE Muestra las diferencias entre los archivos en el área de trabajo y el último commit
        gdh = "git diff HEAD";                                     # NOTE "" en HEAD
        gdca = "git diff --cached";                                # NOTE Muestra las diferencias entre los archivos en el área de preparación y el último commit
        gds = "git diff --staged";                                 # NOTE Muestra las diferencias entre los archivos en el área de preparación y el último commit
        
        grb = "git rebase";                                        # NOTE Reorganiza commits para crear un historial de commits más limpio
        grba = "git rebase --abort";                               # NOTE Aborta el proceso de rebase y restaura el estado original
        grbc = "git rebase --continue";                            # NOTE Continúa el proceso de rebase después de resolver conflictos
        grbi = "git rebase --interactive";                         # NOTE Inicia un rebase interactivo para editar, reordenar o combinar commits

        grst = "git restore --staged";                             # NOTE Restaura archivos del área de preparación al área de trabajo (LOCAL/HEAD)
        gundo = "git reset HEAD~1 --mixed";                        # NOTE Revertirá todos los cambios de confirmación en el área local sin preparación, para que pueda realizar modificaciones y agregarlas al área de almacenamiento provisional (INDEX/STAGING)
        gpristine = "git reset --hard && git clean --force -dfx";  # NOTE Restaura el repositorio al estado del último commit y elimina archivos no rastreados
        groh = "git reset origin/$(git_current_branch) --hard";    # NOTE Restaura la rama actual al estado del último commit en el origen

        gsh = "git show";                                          # NOTE Muestra información sobre un objeto de Git (commit, tag, etc.)

        gst = "git status";                                        # NOTE Muestra el estado actual del repositorio

        gstl = "git stash list";                                   # NOTE Lista todos los stashes guardados
        gsta = "git stash push";                                   # NOTE Guarda los cambios actuales en un stash
        gstp = "git stash pop";                                    # NOTE Aplica los cambios del stash más reciente y lo elimina de la lista

        gsw = "git switch";                                        # NOTE Cambia de rama
        gswc = "git switch --create";                              # NOTE Crea y cambia a una nueva rama

        gbr = "git branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate"; 
                                                                   # NOTE Enumerará todas las ramas y las ordenará por fecha de confirmación, mostrando primero la rama de git más reciente, en función de las confirmaciones realizadas en ella
        gdone = "git !git push origin HEAD";                       # NOTE Local al Remoto
        glog = "git !git log --pretty=format:\"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]\" --abbrev-commit -30";
                                                                   # NOTE Log Cool
 
        
      };

      shellAbbrs = {
        n = "cd /etc/nixos/modules/nixos/";
        h = "cd /etc/nixos/modules/home-manager";
        
        hpro = "cd /etc/nixos/modules/home-manager/programs";

        home = "cd /etc/nixos/modules/home-manager";
        nix = "cd /etc/nixos/modules/nixos";

        s = "sudo hx";
        
        t = "touch";

        build = "sudo nixos-rebuild switch --flake /etc/nixos#";

        # Git
        gcop = "git checkout -b"; # NOTE Crea una nueva rama y entra a ella; gcob feat/add-popup
        gdel = "git branch -D"; # NOTE Borra una rama; gdel feat/add-popup

      };
      
    };
    
  };
  
}
