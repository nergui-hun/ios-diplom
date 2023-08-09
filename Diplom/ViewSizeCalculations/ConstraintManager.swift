//
//  StackViewElementSizeCalculations.swift
//  Diplom
//
//  Created by M M on 7/29/23.
//

import Foundation
import UIKit

class ConstraintManager {

    // MARK: - Values
    static let shared = ConstraintManager()
    private let screenWidth: CGFloat = UIScreen.main.bounds.width

    //MARK: - Methods

    func getVerticalStackViewHeight(
        heightArray elements: [CGFloat], spacing: CGFloat = 16,
        paddingTop: CGFloat = 16, paddingBottom: CGFloat = 16) -> CGFloat {

            calculateOtherElementsSizeSum(elements: elements) +
            calculateWhiteSpaceSize(sizeArray: elements, spacing: spacing,
                                    firstPadding: paddingTop, secondPadding: paddingBottom)
        }

    func getHorizontalStackViewWidth(
        widthArray elements: [CGFloat], spacing: CGFloat = 16,
        paddingLeft: CGFloat = 16, paddingRight: CGFloat = 16) -> CGFloat {

            return calculateOtherElementsSizeSum(elements: elements) +
            calculateWhiteSpaceSize(sizeArray: elements, spacing: spacing,
                                    firstPadding: paddingLeft, secondPadding: paddingRight)
        }

    func calculateElementWidth(
        widthArray elements: [CGFloat], spacing: CGFloat = 16,
        paddingLeft: CGFloat = 16, paddingRight: CGFloat = 16) -> CGFloat {

            return screenWidth - calculateOtherElementsSizeSum(elements: elements)
            - calculateWhiteSpaceSize(sizeArray: elements, spacing: spacing,
                                      firstPadding: paddingLeft, secondPadding: paddingRight)
        }

    func calculateElementHeight(
        heightArray elements: [CGFloat], viewHeight: CGFloat, spacing: CGFloat = 16,
        paddingTop: CGFloat = 16, paddingBottom: CGFloat = 16) -> CGFloat {

            return viewHeight - calculateOtherElementsSizeSum(elements: elements)
            - calculateWhiteSpaceSize(sizeArray: elements, spacing: spacing,
                                      firstPadding: paddingTop, secondPadding: paddingBottom)
        }

    private func calculateWhiteSpaceSize(
        sizeArray elements: [CGFloat], spacing: CGFloat, firstPadding: CGFloat, secondPadding: CGFloat) -> CGFloat {

        let numberOfSpacings = CGFloat(elements.count - 1)
        let spacingSum = numberOfSpacings * spacing

        return firstPadding + secondPadding + spacingSum
    }

    private func calculateOtherElementsSizeSum(elements: [CGFloat]) -> CGFloat {
        var result: CGFloat = 0
        elements.forEach({result += $0 })
        return result
    }

    func getScreenWidth() -> CGFloat {
        screenWidth
    }
}
