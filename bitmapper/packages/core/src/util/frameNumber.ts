export const frameNumber = (index: number, padding: number) => {
        let result = "" + index;
        while (result.length < padding) {
                result = "0" + result;
        }
        return result;
};
