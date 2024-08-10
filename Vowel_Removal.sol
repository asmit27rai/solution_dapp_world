// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RemoveVowels {

    /**
     * @notice removeVowels removes all vowels from the input string
     * @param _input the input string from which vowels will be removed
     * @return the string with all vowels removed
     */
    function removeVowels(string memory _input) public pure returns (string memory) {
        bytes memory inputBytes = bytes(_input);
        bytes memory resultBytes = new bytes(inputBytes.length);

        uint256 j = 0;
        for (uint256 i = 0; i < inputBytes.length; i++) {
            bytes1 char = inputBytes[i];
            if (
                char != 'a' && char != 'e' && char != 'i' && char != 'o' && char != 'u' &&
                char != 'A' && char != 'E' && char != 'I' && char != 'O' && char != 'U'
            ) {
                resultBytes[j] = char;
                j++;
            }
        }

        // Resize the resultBytes array to the actual length
        bytes memory trimmedResultBytes = new bytes(j);
        for (uint256 k = 0; k < j; k++) {
            trimmedResultBytes[k] = resultBytes[k];
        }

        return string(trimmedResultBytes);
    }
}