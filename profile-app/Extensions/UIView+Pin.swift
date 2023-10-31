//
//  UIView+Pin.swift
//  profile-app
//  Created by Донских Елена on 11.10.2023.
//
import UIKit

extension UIView {
    enum ConstraintMode {
    case equal
    case grQE
    case IsQE
    }
    
    
    enum PinSides {
        case top, bottom, left, right
    }
    
    
    @discardableResult
    func pinLeft(to otherView: UIView, _ const: Double = 0, _ mode: ConstraintMode = .equal) -> NSLayoutConstraint {
        pinConstraint(mode: mode, leadingAnchor, otherView.leadingAnchor, constant: const)
    }
    
    @discardableResult
    func pinLeft(to anchor: NSLayoutXAxisAnchor, _ const: Double = 0, _ mode: ConstraintMode = .equal) -> NSLayoutConstraint {
        return pinConstraint(mode: mode, leadingAnchor, anchor, constant: const)
    }
    
    @discardableResult
    func pinRight(to otherView: UIView, _ const: Double = 0, _ mode: ConstraintMode = .equal) -> NSLayoutConstraint {
        pinConstraint(mode: mode, trailingAnchor, otherView.trailingAnchor, constant: -1 * const)
    }
    
    @discardableResult
    func pinRight(to anchor: NSLayoutXAxisAnchor, _ const: Double = 0, _ mode: ConstraintMode = .equal) -> NSLayoutConstraint {
        return pinConstraint(mode: mode, trailingAnchor, anchor, constant: -1 * const)
    }
    
    @discardableResult
    func pinTop(to otherView: UIView, _ const: Double = 0, _ mode: ConstraintMode = .equal) -> NSLayoutConstraint {
        pinConstraint(mode: mode, topAnchor, otherView.topAnchor, constant: const)
    }
    
    @discardableResult
    func pinTop(to anchor: NSLayoutYAxisAnchor, _ const: Double = 0, _ mode: ConstraintMode = .equal) -> NSLayoutConstraint {
        return pinConstraint(mode: mode, topAnchor, anchor, constant: const)
    }
    
    @discardableResult
    func pinBottom(to otherView: UIView, _ const: Double = 0, _ mode: ConstraintMode = .equal) -> NSLayoutConstraint {
        pinConstraint(mode: mode, bottomAnchor, otherView.bottomAnchor, constant: -1 * const)
    }
    
    @discardableResult
    func pinBottom(to anchor: NSLayoutYAxisAnchor, _ const: Double = 0, _ mode: ConstraintMode = .equal) -> NSLayoutConstraint {
        return pinConstraint(mode: mode, bottomAnchor, anchor, constant: const)
    }
    
    
    @discardableResult
    func pinCenter(to otherView: UIView) {
        pinConstraint(mode: .equal, centerXAnchor, otherView.centerXAnchor)
        pinConstraint(mode: .equal, centerYAnchor, otherView.centerYAnchor)
    }
    
    @discardableResult
    func pinCenterX(to otherView: UIView, _ const: Double = 0, _ mode: ConstraintMode = .equal) -> NSLayoutConstraint {
        pinConstraint(mode: mode, centerXAnchor, otherView.centerXAnchor, constant: const)
    }
    
    @discardableResult
    func pinCenterX(to anchor: NSLayoutXAxisAnchor, _ const: Double = 0, _ mode: ConstraintMode = .equal) -> NSLayoutConstraint {
        pinConstraint(mode: mode, centerXAnchor, anchor, constant: const)
    }
    
    @discardableResult
    func pinCenterY(to otherView: UIView, _ const: Double = 0, _ mode: ConstraintMode = .equal) -> NSLayoutConstraint {
        pinConstraint(mode: mode, centerYAnchor, otherView.centerYAnchor, constant: const)
    }
    
    @discardableResult
    func pinCenterY(to anchor: NSLayoutYAxisAnchor, _ const: Double = 0, _ mode: ConstraintMode = .equal) -> NSLayoutConstraint {
        pinConstraint(mode: mode, centerYAnchor, anchor, constant: const)
    }
    
    @discardableResult
    func pinWidth(to otherView: UIView, _ mult: Double = 1, _ mode: ConstraintMode = .equal) -> NSLayoutConstraint {
        pinConstraint(mode: mode, widthAnchor, otherView.widthAnchor, multiplier: mult)
    }
    
    @discardableResult
    func pinWidth(to dimension: NSLayoutDimension, _ mult: Double = 1, _ mode: ConstraintMode = .equal) -> NSLayoutConstraint {
        pinConstraint(mode: mode, widthAnchor, dimension, multiplier: mult)
    }
    
    @discardableResult
    func setWidth(mode: ConstraintMode = .equal, _ const: Double = 0) -> NSLayoutConstraint {
        pinDimension(mode: mode, widthAnchor, constant: const)
    }
    
    @discardableResult
    func pinHeight(to otherView: UIView, _ mult: Double = 1, _ mode: ConstraintMode = .equal) -> NSLayoutConstraint {
        pinConstraint(mode: mode, heightAnchor, otherView.heightAnchor, multiplier: mult)
    }
    
    @discardableResult
    func pinHeight(to dimension: NSLayoutDimension, _ mult: Double = 1, _ mode: ConstraintMode = .equal) -> NSLayoutConstraint {
        pinConstraint(mode: mode, heightAnchor, dimension, multiplier: mult)
    }
    
    @discardableResult
    func setHeight(mode: ConstraintMode = .equal, _ const: Double = 0) -> NSLayoutConstraint {
        pinDimension(mode: mode, heightAnchor, constant: const)
    }
    
    func pinHorizontal(to otherView: UIView, _ const: Double = 0, mode: ConstraintMode = .equal) {
        pinLeft(to: otherView, const, mode)
        pinRight(to: otherView, const, mode)
    }
    
    func pinVertical(to otherView: UIView, _ const: Double = 0, mode: ConstraintMode = .equal) {
        pinTop(to: otherView, const, mode)
        pinBottom(to: otherView, const, mode)
    }
    
    func pin(to otherView: UIView, _ const: Double = 0) {
        pinVertical(to: otherView, const)
        pinHeight(to: otherView, const)
    }
    
    @discardableResult
    private func pinConstraint<Axis: AnyObject, AnyAnchor: NSLayoutAnchor<Axis>>(mode: ConstraintMode, _ firstAnchor: AnyAnchor, _ secondAnchor: AnyAnchor, constant: Double = 0) -> NSLayoutConstraint {
        let const = CGFloat(constant)
        let result: NSLayoutConstraint
        translatesAutoresizingMaskIntoConstraints = false
        switch mode {
        case .equal:
            result = firstAnchor.constraint(equalTo: secondAnchor, constant: const)
        case .grQE:
            result = firstAnchor.constraint(greaterThanOrEqualTo: secondAnchor, constant: const)
        case .IsQE:
            result = firstAnchor.constraint(lessThanOrEqualTo: secondAnchor, constant: const)
        }
        result.isActive = true
        return result
    }
    
    
    @discardableResult
    private func pinConstraint(mode: ConstraintMode, _ firstDimension: NSLayoutDimension, _ secondDimension: NSLayoutDimension, multiplier: Double = 1) -> NSLayoutConstraint {
        let mult = CGFloat(multiplier)
        let result: NSLayoutConstraint
        translatesAutoresizingMaskIntoConstraints = false
        switch mode {
        case .equal:
            result = firstDimension.constraint(equalTo: secondDimension, multiplier: mult)
        case .grQE:
            result = firstDimension.constraint(greaterThanOrEqualTo: secondDimension, multiplier: mult)
        case .IsQE:
            result = firstDimension.constraint(lessThanOrEqualTo: secondDimension, multiplier: mult)
        }
        result.isActive = true
        return result
    }
    
    
    @discardableResult
    private func pinDimension(mode: ConstraintMode, _ dimension: NSLayoutDimension, constant: Double) -> NSLayoutConstraint {
        let const = CGFloat(constant)
        let result: NSLayoutConstraint
        translatesAutoresizingMaskIntoConstraints = false
        switch mode {
        case .equal:
            result = dimension.constraint(equalToConstant: const)
        case .grQE:
            result = dimension.constraint(greaterThanOrEqualToConstant: const)
        case .IsQE:
            result = dimension.constraint(lessThanOrEqualToConstant: const)
        }
        result.isActive = true
        return result
    }
    
    
}
