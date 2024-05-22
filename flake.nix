{
  description = ''
    Opinionated flake templates for different developement environments.

    Use `nix flake new -t github:zmitchell/flake-templates#<template>` to use the template
  '';
  outputs = self: rec {
    templates = {

      basic_shell = {
        path = ./basic_shell;
        description = "A basic development shell with no packages";
      };
    };

    defaultTemplate = templates.basic_shell;
  };
}
