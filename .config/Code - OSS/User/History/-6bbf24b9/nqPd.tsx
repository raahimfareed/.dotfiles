interface ITopNavLink {
    name: string;
    url?: string;
    className?: string;
}

const TopNavLink = ({ name, url = "", className = "" }: ITopNavLink) => {
    return <a className="p-3 inline-flex items-center justify-content">{name}</a>
}

export default TopNavLink;