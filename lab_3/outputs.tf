/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

# output "load_balancer_default_ip" {
#   description = "The external ip address of the forwarding rule for default lb."
#   value       = module.load_balancer_default.external_ip
# }

output "app_engine_code_bucket" {
  description = "App Engine bucket storage"
  value       = module.webapp.code_bucket
}

output "app_hostname" {
  description = "Application hostname"
  value       = module.webapp.default_hostname
}