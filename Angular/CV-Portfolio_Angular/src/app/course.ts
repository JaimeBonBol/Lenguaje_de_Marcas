export class Course {
    title: string = "";
    where: string = "";
    during: string = "";

    constructor(title: string, where: string, during: string) {
        this.title = title;
        this.where = where;
        this.during = during;
    }

    
    public getTitle() : string {
        return this.title;
    }

    
    public getWhere() : string {
        return this.where;
    }

    
    public getDuring() : string {
        return this.during;
    }
    
    
    
}