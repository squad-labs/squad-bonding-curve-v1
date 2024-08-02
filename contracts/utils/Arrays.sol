// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import { StorageSlot } from "./StorageSlot.sol";
import { Math } from "./math/Math.sol";

library Arrays {
  using StorageSlot for bytes32;

  function findUpperBound(uint256[] storage array, uint256 element) internal view returns (uint256) {
    uint256 low = 0;
    uint256 high = array.length;

    if (high == 0) {
      return 0;
    }

    while (low < high) {
      uint256 mid = Math.average(low, high);

      if (unsafeAccess(array, mid).value > element) {
        high = mid;
      } else {
        low = mid + 1;
      }
    }

    if (low > 0 && unsafeAccess(array, low - 1).value == element) {
      return low - 1;
    } else {
      return low;
    }
  }

  function unsafeAccess(address[] storage arr, uint256 pos) internal pure returns (StorageSlot.AddressSlot storage) {
    bytes32 slot;

    assembly {
      mstore(0, arr.slot)
      slot := add(keccak256(0, 0x20), pos)
    }

    return slot.getAddressSlot();
  }

  function unsafeAccess(uint256[] storage arr, uint256 pos) internal pure returns (StorageSlot.Uint256Slot storage) {
    bytes32 slot;

    assembly {
      mstore(0, arr.slot)
      slot := add(keccak256(0, 0x20), pos)
    }

    return slot.getUint256Slot();
  }

  function unsafeMemoryAccess(uint256[] memory arr, uint256 pos) internal pure returns (uint256 res) {
    assembly {
      res := mload(add(add(arr, 0x20), mul(pos, 0x20)))
    }
  }

  function unsafeMemoryAccess(address[] memory arr, uint256 pos) internal pure returns (address res) {
    assembly {
      res := mload(add(add(arr, 0x20), mul(pos, 0x20)))
    }
  }
}