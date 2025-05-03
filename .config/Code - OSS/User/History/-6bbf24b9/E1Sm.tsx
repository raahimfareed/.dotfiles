interface ITopNavLink {
    name: string;
}

const TopNavLink = ({ name }: ITopNavLink) => {
    return <div className="inline-flex items-center justify-content"><a href="" className="p-3">{name}</a></div>
}

export default TopNavLink;