{ users,... }:
{
  networking.hostName = "${users.primary}";
}
