#include "grabcommon.h"

void HandleErrorEn(const int en, const char* msg)
{
  errno = en;
  perror(msg);
  exit(EXIT_FAILURE);
}

void PrintColor(const char color, const char* text, ...)
{
  va_list args;
  va_start(args, text);
  std::string text_str(text);
  std::string full_text;
  switch (color)
  {
  case 'y':
    full_text = ANSI_COLOR_YELLOW + (text_str + ANSI_COLOR_RESET + "\n");
    break;
  case 'r':
    full_text = ANSI_COLOR_RED + (text_str + ANSI_COLOR_RESET + "\n");
    break;
  default:
    full_text = text_str + "\n";
    break;
  }
  vprintf(full_text.c_str(), args);
  va_end(args);
}

void PrintColor(const char color, const char* text, va_list args)
{
  std::string text_str(text);
  std::string full_text;
  switch (color)
  {
  case 'y':
    full_text = ANSI_COLOR_YELLOW + (text_str + ANSI_COLOR_RESET + "\n");
    break;
  case 'r':
    full_text = ANSI_COLOR_RED + (text_str + ANSI_COLOR_RESET + "\n");
    break;
  default:
    full_text = text_str + "\n";
    break;
  }
  vprintf(full_text.c_str(), args);
}

void DispRetVal(const int err, const char * msg, ...)
{
  va_list args;
  va_start(args, msg);
  std::string full_msg = msg + GetRetValStr(err);
  PrintColor(err ? 'r' : 'w', full_msg.c_str(), args);
  va_end(args);
}

std::string GetRetValStr(const int err)
{
  std::string description;
  switch (err)
  {
    case OK:
      description = "SUCCESS";
      break;
    case ECONFIG:
      description = "Configuration FAILED";
      break;
    case EREG:
      description = "Registration FAILED";
      break;
    case EACTIVE:
      description = "Activation FAILED";
      break;
    case EINIT:
      description = "Initialization FAILED";
      break;
    case EINV:
      description = "Invalid value";
      break;
    case EFAIL:
      description = "FAILED";
      break;
  }
  return description;
}