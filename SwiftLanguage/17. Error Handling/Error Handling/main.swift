// MARK: - Error Handling

// MARK: - Representing and Throwing Errors

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

//throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

// MARK: - Handling Errors

// MARK: Propagating Errors Using Throwing Functions

// MARK: Handling Errors Using Do-Catch

// MARK: Converting Errors to Optional Values

// MARK: Disabling Error Propagation

// MARK: - Specifying Cleanup Actions
