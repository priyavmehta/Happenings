def aadharNumVerify(adharNum: str) -> bool:
    """
    Takes a N digit aadhar number and
    returns a boolean value whether that is Correct or Not
    """
    verhoeff_table_d = (
        (0, 1, 2, 3, 4, 5, 6, 7, 8, 9),
        (1, 2, 3, 4, 0, 6, 7, 8, 9, 5),
        (2, 3, 4, 0, 1, 7, 8, 9, 5, 6),
        (3, 4, 0, 1, 2, 8, 9, 5, 6, 7),
        (4, 0, 1, 2, 3, 9, 5, 6, 7, 8),
        (5, 9, 8, 7, 6, 0, 4, 3, 2, 1),
        (6, 5, 9, 8, 7, 1, 0, 4, 3, 2),
        (7, 6, 5, 9, 8, 2, 1, 0, 4, 3),
        (8, 7, 6, 5, 9, 3, 2, 1, 0, 4),
        (9, 8, 7, 6, 5, 4, 3, 2, 1, 0))

    verhoeff_table_p = (
        (0, 1, 2, 3, 4, 5, 6, 7, 8, 9),
        (1, 5, 7, 6, 2, 8, 3, 0, 9, 4),
        (5, 8, 0, 3, 7, 9, 6, 1, 4, 2),
        (8, 9, 1, 6, 0, 4, 3, 5, 2, 7),
        (9, 4, 5, 3, 1, 2, 6, 8, 7, 0),
        (4, 2, 8, 6, 5, 7, 3, 9, 0, 1),
        (2, 7, 9, 3, 8, 0, 6, 4, 1, 5),
        (7, 0, 4, 6, 9, 1, 3, 2, 5, 8))

    # verhoeff_table_inv = (0, 4, 3, 2, 1, 5, 6, 7, 8, 9)

    def checksum(s: str) -> int:
        """For a given number generates a Verhoeff digit and
        returns number + digit"""
        c = 0
        for i, item in enumerate(reversed(s)):
            c = verhoeff_table_d[c][verhoeff_table_p[i % 8][int(item)]]
        return c

    # Validate Verhoeff checksum
    return checksum(adharNum) == 0 and len(adharNum) == 12

# print(aadharNumVerify('112233445566'))