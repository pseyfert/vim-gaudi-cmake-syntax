" Copyright (C) 2018  CERN for the benefit of the LHCb collaboration
" Author: Paul Seyfert <pseyfert@cern.ch>
"
" This software is distributed under the terms of the GNU General Public
" Licence version 3 (GPL Version 3), copied verbatim in the file "LICENSE".
"
" In applying this licence, CERN does not waive the privileges and immunities
" granted to it by virtue of its status as an Intergovernmental Organization
" or submit itself to any jurisdiction.

if exists("b:current_syntax")
  if b:current_syntax != "cmake"
    finish
  endif
endif
let s:keepcpo= &cpo
set cpo&vim

" I'd like to acknowledge the help in
" https://vi.stackexchange.com/a/17847

syn clear cmakeArguments
syn region cmakeArguments start="(" end=")" contains=ALLBUT,cmakeCommand,cmakeCommandConditional,cmakeCommandRepeat,cmakeCommandDeprecated,cmakeArguments,@cmakeGaudi

syn region GaudiAddLibraryRegion start="(" end=")" contains=GaudiAddLibraryArguments contained

syn region GaudiAddModuleRegion start="(" end=")" contains=GaudiAddModuleArguments contained

syn region GaudiAddDictionaryRegion start="(" end=")" contains=GaudiAddDictionaryArguments contained

syn region GaudiCommonAddBuildRegion start="(" end=")" contains=GaudiCommonAddBuildArguments contained

syn region BareParentheses start="(" end=")" contains=ALLBUT,DoesNotExist contained

syn region GaudiProjectRegion start="(" end=")" contains=GaudiProjectArguments contained

syn case match

syn keyword GaudiCommonAddBuildArguments contained
        \ LINK_LIBRARIES
        \ INCLUDE_DIRS

syn keyword GaudiProjectArguments contained
        \ USE
        \ TOOLS
        \ DATA
        \ FORTRAN

syn keyword GaudiAddDictionaryArguments contained
        \ SPLIT_CLASSDEF
        \ LINK_LIBRARIES
        \ INCLUDE_DIRS
        \ OPTIONS

syn keyword GaudiAddModuleArguments contained
        \ GENCONF_PRELOAD
        \ GENCONF_USER_MODULE
        \ INCLUDE_DIRS
        \ LINK_LIBRARIES

syn keyword GaudiAddLibraryArguments contained
        \ INCLUDE_DIRS
        \ LINK_LIBRARIES
        \ PUBLIC_HEADERS
        \ NO_PUBLIC_HEADERS

syn case ignore

syn keyword cmake_gaudi_add_library
            \ gaudi_add_library
            \ nextgroup=GaudiAddLibraryRegion

syn keyword cmake_gaudi_common_add_build
           \ gaudi_add_python_module
           \ gaudi_add_executable
           \ nextgroup=GaudiCommonAddBuildRegion

syn keyword cmake_gaudi_add_module
            \ gaudi_add_module
            \ nextgroup=GaudiAddModuleRegion

syn keyword cmake_gaudi_add_dictionary
            \ gaudi_add_dictionary
            \ nextgroup=GaudiAddDictionaryRegion

syn keyword cmake_gaudi_function_without_keyword
           \ gaudi_depends_on_subdir
           \ gaudi_install_headers
           \ gaudi_install_python_modules
           \ gaudi_install_scripts
           \ gaudi_alias
           \ gaudi_install_joboptions
           \ nextgroup=BareParentheses

syn keyword cmake_gaudi_project
          \ gaudi_project
          \ nextgroup=GaudiProjectRegion

hi def link cmake_gaudi_add_library Function
hi def link cmake_gaudi_add_module Function
hi def link cmake_gaudi_add_dictionary Function
hi def link cmake_gaudi_common_add_build Function
hi def link cmake_gaudi_function_without_keyword Function
hi def link cmake_gaudi_project Function
hi def link GaudiAddLibraryArguments ModeMsg
hi def link GaudiAddModuleArguments ModeMsg
hi def link GaudiAddDictionaryArguments ModeMsg
hi def link GaudiCommonAddBuildArguments ModeMsg
hi def link GaudiProjectArguments ModeMsg

syntax cluster cmakeGaudi contains=GaudiAddLibraryArguments,GaudiAddLibraryRegion,GaudiAddModuleArguments,GaudiAddModuleRegion,GaudiAddDictionaryArguments,GaudiAddDictionaryRegion,GaudiCommonAddBuildRegion,GaudiCommonAddBuildArguments,cmake_gaudi_add_library,cmake_gaudi_add_module,cmake_gaudi_common_add_build,cmake_gaudi_add_dictionary,BareParentheses,cmake_gaudi_function_without_keyword,GaudiProjectArguments,GaudiProjectRegion,cmake_gaudi_project

let &cpo = s:keepcpo
unlet s:keepcpo
