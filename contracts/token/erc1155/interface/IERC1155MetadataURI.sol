// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import { IERC1155 } from "./IERC1155.sol";

interface IERC1155MetadataURI is IERC1155 {
  function uri(uint256 id) external view returns (string memory);
}