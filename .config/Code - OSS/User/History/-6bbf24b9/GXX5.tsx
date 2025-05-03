interface ITopNavLink {
    name: string;
    url?: string;
    className?: string;
}

const TopNavLink = ({ name, url = "", className = "" }: ITopNavLink) => {
    return <a href={url} className={
        "inline-flex items-center justify-content " + 
        className
    }>{name}</a>
}

export default TopNavLink;