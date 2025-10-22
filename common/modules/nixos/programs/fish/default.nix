{
  programs.fish = {
    enable = true;

    vendor = {
      completions.enable = false;
      config.enable = false;
      functions.enable = false;
    };
    
    # NOTE Remove Fish greeting and add HelixGPT env Handler
    interactiveShellInit = "
      set -g fish_greeting
      set -gx HANDLER codeium
    ";

    shellAliases = {
      clean = "nh clean all";
      nho = "nh os switch --ask";
      nhh = "nh home switch --ask";
      bnh = "nho && nhh";

      fbuild = "flakeupdate && bnh && clean";
      cbuild = "bnh && clean";
    
      flake = "cd /etc/nixos/ && hx flake.nix";
      flakeupdt = "nix flake update --flake /etc/nixos";
               
      npac = "cd /etc/nixos/common/modules/nixos/packages && hx default.nix";
      hpac = "cd /etc/nixos/common/modules/home-manager/packages && hx default.nix";

      d = "hx default.nix";
      b = "cd ..";
      
      y = "yazi";

      pkgs = "nix-store --query --requisites /run/current-system | cut -d- -f2- | sort -u";

      # GH
      ghs = "gh auth switch";
      
      # Git                                                      # DUMB NOTES
      gi = "git init";
      ga = "git add";
      gaa = "git add --all";                                     # NOTE Añade todos los cambios en el repositorio al área de preparación
      
      gc = "git commit --verbose";                               # NOTE Crea un commit y muestra el diff de los cambios
      gca = "git commit --verbose --all";                        # NOTE Añade todos los cambios y crea un commit mostrando el diff
      gcaamd = "git commit --verbose --all --amend";             # NOTE Añade todos los cambios y modifica el último commit
      gcanamd = "git commit --verbose --all --no-edit --amend";  # NOTE Añade todos los cambios y modifica el último commit sin cambiar el mensaje
      gcamd = "git commit --verbose --amend";                    # NOTE Modifica el último commit y muestra el diff de los cambios
      gcn = "git commit --verbose --no-edit --amend";            # NOTE Modifica el último commit sin cambiar el mensaje
      
      gd = "git diff";                                           # NOTE Muestra las diferencias entre los archivos en el área de trabajo y el último commit
      gdh = "git diff HEAD";                                     # NOTE "" en HEAD
      gds = "git diff --staged";                                 # NOTE Muestra las diferencias entre los archivos en el área de preparación y el último commit
      
      grb = "git rebase";                                        # NOTE Reorganiza commits para crear un historial de commits más limpio
      grba = "git rebase --abort";                               # NOTE Aborta el proceso de rebase y restaura el estado original
      grbc = "git rebase --continue";                            # NOTE Continúa el proceso de rebase después de resolver conflictos
      grbi = "git rebase --interactive";                         # NOTE Inicia un rebase interactivo para editar, reordenar o combinar commits

      gundo = "git reset --mixed HEAD~1";                        # NOTE Elimina el último commit manteniendo cambios
      gsundo = "git reset --soft HEAD~1";                        # NOTE Elimina el último commit manteniendo cambios listos para un nuevo commit
      gpristine = "git reset --hard && git clean --force -dfx";  # NOTE Restaura el repositorio al estado del último commit y elimina archivos no rastreados

      gsh = "git show";                                          # NOTE Muestra información sobre un objeto de Git (commit, tag, etc.)
      gst = "git status";                                        # NOTE Muestra el estado actual del repositorio

      gstl = "git stash list";                                   # NOTE Lista todos los stashes guardados
      gsta = "git stash push";                                   # NOTE Guarda los cambios actuales en un stash
      gstp = "git stash pop";                                    # NOTE Aplica los cambios del stash más reciente y lo elimina de la lista

      gbr = "git branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate";                    # NOTE Enumera todas las ramas en ordenen de fecha de confirmación
      
     }; 

    shellAbbrs = {
      n = "cd /etc/nixos/common/modules/nixos/";
      h = "cd /etc/nixos/common/modules/home-manager/";

      npro = "cd /etc/nixos/common/modules/nixos/programs/";
      hpro = "cd /etc/nixos/common/modules/home-manager/programs/";
      
      jhpro = "cd /etc/nixos/home/jonvemo/modules/programs/";

      wp = "cd Documents/Work/GitHub/";
      wpa = "cd Desktop/GitHub/";
      wpd = "cd Documents/Work/GitHub/Default/";
      wps = "cd Documents/Work/GitHub/Study/";

      t = "touch";

      flakeupdti = "nix flake update --flake /etc/nixos";
      
      vpkg = "nix-store --query --requisites /run/current-system | cut -d- -f2- | sort -u | grep";
      
      # Git
      g = "git";
      gcm = "git commit -m";
      gsw = "git switch";                      # NOTE Cambiar de rama
      gswc = "git switch --create";            # NOTE Crea una nueva rama y entra en ella
      gdelb = "git branch -D";                 # NOTE Borra una rama; gdel feat/add-popup

      grst = "git restore --staged";           # NOTE Restaura archivos del área de preparación al área de trabajo (LOCAL/HEAD)

      gir = "git init && git remote add origin https://github.com/user/repo.git";
      gpbr = "git push -u origin branch";      # NOTE Pushea nueva rama
      gdone = "git push origin HEAD";          # NOTE Pushea los cambios
      gpull = "git pull origin HEAD";
      gresetall = "git reset origin/  --hard"; # NOTE Borra todos los cambios y regresa al origin de la rama

      glog = "git log --pretty=format:\"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]\" --abbrev-commit -30";
      
    };
    
  };
  
}
