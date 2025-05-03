interface ITopNavLink {
    name: string;
    url: string;
}

const TopNavLink = ({ name, url }: ITopNavLink) => {
    return <div className="inline-flex items-center justify-content"><a href={url} className="p-3">{name}</a></div>
}

export default TopNavLink;