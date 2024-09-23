{
  programs.fish = {
    enable = true;
    
    # NOTE Habilita Starship en la Terminal
    # shellInit = "starship init fish | source";
    
    # NOTE Borra el Mensaje de Bienvenida de Fish y añade el Handler para que HelixGPT funcione
    interactiveShellInit = "
      set -g fish_greeting | kittysay -c 3 7 -t 'meow mrrrow mrrrp nyaaa nya nyaaa meow meowwww nyaaa meowwww'
      set -gx HANDLER codeium
    ";

    shellAliases = {
        # sudo = "doas";
        
        flake = "cd /etc/nixos/ & sudo hx flake.nix";
        flakeupdate = "sudo nix flake update";
                
        jconfig = "cd /etc/nixos/hosts/jonvemo & sudo hx configuration.nix";
        jhome = "cd /etc/nixos/hosts/jonvemo & sudo hx home.nix";

        npac = "cd /etc/nixos/modules/nixos/packages & sudo hx default.nix";
        hpac = "cd /etc/nixos/modules/home-manager/packages & sudo hx default.nix";

        sd = "sudo hx default.nix";
        b = "cd ..";

        # GH
        ghs = "gh auth switch";
        
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

        gsh = "git show";                                          # NOTE Muestra información sobre un objeto de Git (commit, tag, etc.)

        gst = "git status";                                        # NOTE Muestra el estado actual del repositorio

        gstl = "git stash list";                                   # NOTE Lista todos los stashes guardados
        gsta = "git stash push";                                   # NOTE Guarda los cambios actuales en un stash
        gstp = "git stash pop";                                    # NOTE Aplica los cambios del stash más reciente y lo elimina de la lista

        gbr = "git branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate"; 
                                                                   # NOTE Enumerará todas las ramas y las ordenará por fecha de confirmación, mostrando primero la rama de git más reciente, en función de las confirmaciones realizadas en ella
              
      };

      shellAbbrs = {
        n = "cd /etc/nixos/modules/nixos/";
        h = "cd /etc/nixos/modules/home-manager";
        
        home = "cd /etc/nixos/modules/home-manager";
        nixos = "cd /etc/nixos/modules/nixos";

        npro = "cd /etc/nixos/modules/nixos/programs";
        hpro = "cd /etc/nixos/modules/home-manager/programs";

        wp = "cd Documents/Work/GitHub/Projects";
        wpa = "cd Documents/Work/GitHub/Projects/Active";
        wpd = "cd Documents/Work/GitHub/Projects/Default";
        wps = "cd Documents/Work/GitHub/Projects/Study";

        s = "sudo hx";      
        t = "touch";

        build = "sudo nixos-rebuild switch --flake /etc/nixos#";

        # Git
        g = "git";
        gcm = "git commit -m";
        gsw = "git switch";                      # NOTE Cambiar de rama
        gswc = "git switch --create";            # NOTE Crea una nueva rama y entra en ella
        gdelb = "git branch -D";                 # NOTE Borra una rama; gdel feat/add-popup
        
        gpbo = "git push -u origin";             # NOTE Pushea nueva rama
        gdone = "git push origin HEAD";          # NOTE Pushea los cambios
        gresetall = "git reset origin/  --hard"; # NOTE Borra todos los cambios y regresa al origin de la rama

        glog = "git log --pretty=format:\"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]\" --abbrev-commit -30";
        
      };
    
  };

  home.file.".config/fish/functions".source = ./functions;
  
}
