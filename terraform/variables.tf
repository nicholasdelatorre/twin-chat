variable "project_name" {
  description = "Name prefix for all resources"
  type        = string
  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.project_name))
    error_message = "Project name must contain only lowercase letters, numbers, and hyphens."
  }
}

variable "environment" {
  description = "Environment name (dev, test, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment must be one of: dev, test, prod."
  }
}

variable "bedrock_model_id" {
  description = "Bedrock model ID"
  type        = string
  default     = "us.amazon.nova-micro-v1:0"
}

variable "openai_api_key" {
  description = "OpenAI model ID"
  type        = string
  default     = "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"

}

variable "openai_model_id" {
  description = "OpenAI model ID"
  type        = string
  default     = "gpt-4.1-mini"
}

variable "lambda_timeout" {
  description = "Lambda function timeout in seconds"
  type        = number
  default     = 60
}

variable "api_throttle_burst_limit" {
  description = "API Gateway throttle burst limit"
  type        = number
  default     = 10
}

variable "api_throttle_rate_limit" {
  description = "API Gateway throttle rate limit"
  type        = number
  default     = 5
}

variable "use_custom_domain" {
  description = "Attach a custom domain to CloudFront"
  type        = bool
  default     = false
}

variable "root_domain" {
  description = "Apex domain name, e.g. mydomain.com"
  type        = string
  default     = ""
}