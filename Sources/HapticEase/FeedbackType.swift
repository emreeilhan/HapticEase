//
//  FeedbackType.swift
//  
//
//  Created by Emre Ilhan on 8/13/24.
//

import Foundation

/// An enumeration representing the different types of haptic feedback.
public enum FeedbackType {
    case success, error, warning, selection, light, medium, heavy, customLight, lightAndMedium, heavyAndWarning, wave, heartbeat, tensionAndRelease, doubleSelection, complexFeedback, chainReaction,custom(intensity: Float, duration: TimeInterval),rippleEffect, earthquake, pulse, echo, sosSignal
}
