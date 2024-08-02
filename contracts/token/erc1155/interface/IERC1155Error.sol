// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

interface IERC1155Error {
  error ERC1155InsufficientBalance(address sender, uint256 balance, uint256 needed, uint256 tokenId);

  error ERC1155InvalidSender(address sender);

  error ERC1155InvalidReceiver(address receiver);

  error ERC1155MissingApprovalForAll(address operator, address owner);

  error ERC1155InvalidApprover(address approver);

  error ERC1155InvalidOperator(address operator);

  error ERC1155InvalidArrayLength(uint256 idsLength, uint256 valuesLength);
}