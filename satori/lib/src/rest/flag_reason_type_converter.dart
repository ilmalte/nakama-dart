import 'package:json_annotation/json_annotation.dart';
import 'package:satori/src/rest/satori_api.gen.dart';

/// Converter for FlagValueChangeReasonType that handles both integer and string values
class FlagValueChangeReasonTypeConverter
    implements JsonConverter<FlagValueChangeReasonType?, dynamic> {
  const FlagValueChangeReasonTypeConverter();

  @override
  FlagValueChangeReasonType? fromJson(dynamic json) {
    if (json == null) return null;

    // Handle integer values (from API)
    if (json is int) {
      switch (json) {
        case 0:
          return FlagValueChangeReasonType.unknown;
        case 1:
          return FlagValueChangeReasonType.flagVariant;
        case 2:
          return FlagValueChangeReasonType.liveEvent;
        case 3:
          return FlagValueChangeReasonType.experiment;
        default:
          return FlagValueChangeReasonType.unknown;
      }
    }

    // Handle string values (from spec)
    if (json is String) {
      switch (json) {
        case 'UNKNOWN':
          return FlagValueChangeReasonType.unknown;
        case 'FLAG_VARIANT':
          return FlagValueChangeReasonType.flagVariant;
        case 'LIVE_EVENT':
          return FlagValueChangeReasonType.liveEvent;
        case 'EXPERIMENT':
          return FlagValueChangeReasonType.experiment;
        default:
          return FlagValueChangeReasonType.unknown;
      }
    }

    return null;
  }

  @override
  dynamic toJson(FlagValueChangeReasonType? object) {
    // Return string value for JSON serialization
    switch (object) {
      case FlagValueChangeReasonType.unknown:
        return 'UNKNOWN';
      case FlagValueChangeReasonType.flagVariant:
        return 'FLAG_VARIANT';
      case FlagValueChangeReasonType.liveEvent:
        return 'LIVE_EVENT';
      case FlagValueChangeReasonType.experiment:
        return 'EXPERIMENT';
      default:
        return null;
    }
  }
}
