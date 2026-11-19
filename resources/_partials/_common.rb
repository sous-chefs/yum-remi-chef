# frozen_string_literal: true

unified_mode true

include YumRemiChef::Cookbook::Helpers

property :gpgcheck, [true, false], default: true
property :enabled, [true, false], default: true
property :debug_enabled, [true, false], default: false
property :manage_epel, [true, false], default: true
