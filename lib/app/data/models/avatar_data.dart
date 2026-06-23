import 'package:flutter/material.dart';

class AvatarData {
  final String key;
  final String label;
  final String emoji;
  final Color primaryColor;
  final Color secondaryColor;
  final String description;

  const AvatarData({
    required this.key,
    required this.label,
    required this.emoji,
    required this.primaryColor,
    required this.secondaryColor,
    required this.description,
  });
}

const List<AvatarData> archetypes = [
  AvatarData(
    key: 'Warrior',
    label: 'Warrior',
    emoji: '⚔️',
    primaryColor: Color(0xFFE53935),
    secondaryColor: Color(0xFFB71C1C),
    description: 'Bold, fierce, unstoppable',
  ),
  AvatarData(
    key: 'Mage',
    label: 'Mage',
    emoji: '🔮',
    primaryColor: Color(0xFF7B1FA2),
    secondaryColor: Color(0xFF4A148C),
    description: 'Wise, mysterious, powerful',
  ),
  AvatarData(
    key: 'Rogue',
    label: 'Rogue',
    emoji: '🗡️',
    primaryColor: Color(0xFF00897B),
    secondaryColor: Color(0xFF004D40),
    description: 'Swift, cunning, elusive',
  ),
  AvatarData(
    key: 'Healer',
    label: 'Healer',
    emoji: '✨',
    primaryColor: Color(0xFF43A047),
    secondaryColor: Color(0xFF1B5E20),
    description: 'Compassionate, radiant, resilient',
  ),
  AvatarData(
    key: 'Ranger',
    label: 'Ranger',
    emoji: '🏹',
    primaryColor: Color(0xFF6D4C41),
    secondaryColor: Color(0xFF3E2723),
    description: 'Free-spirited, precise, wild',
  ),
  AvatarData(
    key: 'Oracle',
    label: 'Oracle',
    emoji: '🌙',
    primaryColor: Color(0xFF1565C0),
    secondaryColor: Color(0xFF0D47A1),
    description: 'Intuitive, ethereal, ancient',
  ),
];

const List<String> moods = [
  'Determined',
  'Curious',
  'Melancholic',
  'Energetic',
  'Serene',
  'Defiant',
  'Hopeful',
  'Restless',
];

const List<String> goals = [
  'Find my true purpose',
  'Become the strongest',
  'Protect those I love',
  'Uncover a hidden truth',
  'Master a forbidden art',
  'Rebuild what was lost',
  'Break free from the past',
  'Forge a legacy',
];

AvatarData archetypeByKey(String key) =>
    archetypes.firstWhere((a) => a.key == key, orElse: () => archetypes.first);
