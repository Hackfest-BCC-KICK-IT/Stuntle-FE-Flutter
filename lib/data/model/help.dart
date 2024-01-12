import 'package:flutter/material.dart';

import 'package:stuntle/config/color_theme.dart';

enum StatusHelpType {
  accept,
  process,
  denial,
}

extension StatusText on StatusHelpType {
  String get text {
    switch (this) {
      case StatusHelpType.accept:
        return 'Diterima';
      case StatusHelpType.denial:
        return 'Ditolak';
      case StatusHelpType.process:
        return 'Diproses';
    }
  }
}

extension ColorText on StatusHelpType {
  Color get color {
    switch (this) {
      case StatusHelpType.accept:
        return greenColor;
      case StatusHelpType.denial:
        return erorColor;
      case StatusHelpType.process:
        return yellowColor;
    }
  }
}

StatusHelpType getStatusHelpTypeFromString(String statusString) {
  switch (statusString) {
    case 'diterima':
      return StatusHelpType.accept;
    case 'diproses':
      return StatusHelpType.process;
    case 'ditolak':
      return StatusHelpType.denial;
    default:
      return StatusHelpType.process;
  }
}

class HelpSubmit {
  HelpSubmit({
    required this.description,
    required this.statusHelp,
    required this.title,
    required this.additionalMessages,
  });

  final String description;
  final StatusHelpType statusHelp;
  final String title;
  final String additionalMessages;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'additionalMessages': additionalMessages,
      'statusHelp': statusHelp.toString().split('.').last,
    };
  }
}

List<HelpSubmit> dataHelpUser = [];
