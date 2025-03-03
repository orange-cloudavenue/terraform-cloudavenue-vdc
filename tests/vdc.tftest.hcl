# SPDX-FileCopyrightText: Copyright (c) 2025 Orange
# SPDX-License-Identifier: Mozilla Public License 2.0
#
# This software is distributed under the MPL-2.0 license.
# the text of which is available at https://www.mozilla.org/en-US/MPL/2.0/
# or see the "LICENSE" file for more details.

run "setup_tests" {
    command = plan
    module {
        source = "./tests/setup"
    }

   assert {
    condition     = module.vdc_example.vdc.disponibility_class == "ONE-ROOM"
    error_message = "VDC disponibility_class don't match the expected value"
  }

  assert {
    condition     = module.vdc_example.vdc.billing_model == "PAYG"
    error_message = "VDC billing_model don't match the expected value"
  }

  assert {
    condition     = module.vdc_example.vdc.cpu_allocated == 22000
    error_message = "VDC cpu_allocated don't match the expected value"
  }

  assert {
    condition     = module.vdc_example.vdc.cpu_speed_in_mhz == 2200
    error_message = "VDC cpu_speed_in_mhz don't match the expected value"
  }

  assert {
    condition     = module.vdc_example.vdc.memory_allocated == 30
    error_message = "VDC memory_allocated don't match the expected value"
  }

  assert {
    condition     = module.vdc_example.vdc.service_class == "STD"
    error_message = "VDC service_class don't match the expected value"
  }

  assert {
    condition     = module.vdc_example.vdc.storage_billing_model == "PAYG"
    error_message = "VDC storage_billing_model don't match the expected value"
  }
}
