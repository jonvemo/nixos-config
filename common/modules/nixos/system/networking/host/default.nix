{ hosts,... }:
{
  networking.hostName = "${hosts.primary.name}";
}
